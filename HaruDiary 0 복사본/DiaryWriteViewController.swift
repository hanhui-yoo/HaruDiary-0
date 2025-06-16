//
//  DiaryWriteViewController.swift
//  HaruDiary 0
//
//  Created by 유한희 on 5/27/25.
//

import UIKit

class DiaryWriteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    
    var selectedDate: Date?
    var selectedEmotion: String?
    var emotionAlreadyCounted = false
    var imageFileName: String?
    var diaryData: [String: Any]?



    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var diaryTextView: UITextView!
    @IBOutlet weak var emotionLabel: UILabel!
    
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var neutralButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "사진 추가", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "카메라", style: .default) { _ in self.presentImagePicker(sourceType: .camera)
        })
        
        alert.addAction(UIAlertAction(title: "앨범에서 선택", style: .default) { _ in
            self.presentImagePicker(sourceType: .photoLibrary)
        })
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diaryTextView.delegate = self
        
        if let date = selectedDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 MM월 dd일"
            dateLabel.text = dateFormatter.string(from: date)
            
            if let savedText = loadDiary(for: date) {
                diaryTextView.text = savedText
            }
        }
        
        // Do any additional setup after loading the view.
    }
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        guard let emoji = sender.titleLabel?.text else {
            print("❌ emoji 가져오기 실패")
            return
        }
        [happyButton, neutralButton, sadButton].forEach {
                $0?.layer.borderWidth = 0
                $0?.backgroundColor = .clear
            }

            sender.layer.borderWidth = 2
            sender.layer.borderColor = UIColor.systemBlue.cgColor
            sender.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)

            selectedEmotion = emoji
            emotionLabel.text = "📋 오늘의 감정: \(emoji)"
        
            if let date = selectedDate {
                saveDiary(for: date, text: diaryTextView.text)
            }
        
            
        
            if !emotionAlreadyCounted {
                emotionAlreadyCounted = true
        }
    }
    func updateEmotionCount(from oldEmotion: String?, to newEmotion: String?) {
        var counts = UserDefaults.standard.dictionary(forKey: "emotionCounts") as? [String: Int] ?? [:]

        if let old = oldEmotion {
            counts[old, default: 0] = max(0, counts[old, default: 0] - 1)
        }
        
        if let new = newEmotion {
            counts[new, default: 0] += 1
        }
        
        UserDefaults.standard.set(counts, forKey: "emotionCounts")
    }
    
    func saveDiary(for date: Date, text: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let key = formatter.string(from: date)
        
        let oldEmotion = (UserDefaults.standard.dictionary(forKey: key) as? [String: String])?["emotion"]
        
        var diaryData: [String: String] = ["text": text]
        if let emotion = selectedEmotion {
            diaryData["emotion"] = emotion
        }
        
        if let fileName = imageFileName {
            diaryData["image"] = fileName
        }

        
        updateEmotionCount(from: oldEmotion, to: selectedEmotion)
        
        UserDefaults.standard.set(diaryData, forKey: key)
    }
    
    func loadDiary(for date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let key = formatter.string(from: date)
        
        if let diaryData = UserDefaults.standard.dictionary(forKey: key) as? [String: String] {
            
            if let emotion = diaryData["emotion"] {
                selectedEmotion = emotion
                emotionLabel.text = "📋 오늘의 감정: \(emotion)"
            }
            
            if let imageName = diaryData["image"] {
                photoImageView.image = loadImageFromFile(fileName: imageName)
                imageFileName = imageName
            }
            return diaryData["text"] ?? ""
        
        }

        return ""
    }
    
    
    
    @objc func textViewDidChange(_ textView: UITextView) {
        if let date = selectedDate {
            saveDiary(for: date, text: textView.text)
        }
        
        guard let date = selectedDate else { return }

            if selectedEmotion == nil {
                print("⚠️ 감정 선택 안 됨")
                emotionLabel.text = "⚠️ 감정을 선택해주세요!"
                return
        }
        
        saveDiary(for: date, text: textView.text)
        
    }
    
    func presentImagePicker(sourceType: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else { return }

        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker, animated: true)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }

        picker.dismiss(animated: true)

        guard let image = info[.originalImage] as? UIImage else { return }
        photoImageView.image = image

        if let date = selectedDate {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let fileName = "photo_\(formatter.string(from: date)).jpg"
            imageFileName = fileName
            saveImageToFile(image: image, fileName: fileName)
            
            saveDiary(for: date, text: diaryTextView.text ?? "")
        }
    }
    
    func saveImageToFile(image: UIImage, fileName: String) {
        if let data = image.jpegData(compressionQuality: 0.8) {
            let url = getDocumentsDirectory().appendingPathComponent(fileName)
            try? data.write(to: url)
        }
    }

    func loadImageFromFile(fileName: String) -> UIImage? {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        return UIImage(contentsOfFile: url.path)
    }

    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }






    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination        // Pass the selected object to the new view controller.
    }
    */

}
