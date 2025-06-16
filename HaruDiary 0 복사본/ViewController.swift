//
//  ViewController.swift
//  HaruDiary 0
//
//  Created by 유한희 on 5/27/25.
//


class ViewController: UIViewController {
    
    var selectedDate: Date?

    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionSummaryLabel.text = getEmotionSummaryText()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emotionSummaryLabel.text = getEmotionSummaryText()
    }

    @IBAction func goToWriteDiary(_ sender: UIButton) {
        let selectedDate = datePicker.date
        performSegue(withIdentifier: "toWriteDiary", sender: selectedDate)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWriteDiary",
           let destination = segue.destination as? DiaryWriteViewController,
           let date = sender as? Date {
            destination.selectedDate = date
        }
    }
    
    func getEmotionSummaryText() -> String {
        let counts = UserDefaults.standard.dictionary(forKey: "emotionCounts") as? [String: Int] ?? [:]
        let happy = counts["😁"] ?? 0
        let neutral = counts["😐"] ?? 0
        let sad = counts["😢"] ?? 0
        return "😁 \(happy)일   😐 \(neutral)일   😢 \(sad)일"
    }

}

