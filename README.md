# 📘 하루일기 HaruDiary

## 📝 프로젝트 소개
하루의 감정과 생각을 기록하는 **감정 기반 일기 앱**입니다.  
사용자는 감정을 선택하고, 일기를 작성하고 간단한 사진을 추가할 수 있으며, 
저장된 일기를 다시 확인하거나 통계를 통해 감정 추이를 확인할 수 있습니다.

---

## 💡 주요 기능

| 기능명 | 설명 |
|--------|------|
| 감정 선택 | 😁 😐 😢 세 가지 감정 중 하나 선택 가능 |
| 일기 작성 | 날짜별로 텍스트 입력 후 저장 가능 |
| 일기 불러오기 | 앱을 다시 실행해도 해당 날짜의 일기 자동 불러오기 |
| 감정 통계 요약 | 감정별 기록 횟수를 하단에 이모지로 요약 표시 |

---

## 🧾 사용 방법

1. 날짜를 선택합니다.
2. 감정을 이모지 버튼 중에서 선택합니다.
3. 일기를 작성한 뒤 저장하면 자동 저장됩니다.
4. 감정별 통계는 하단에 이모지별로 확인할 수 있습니다.

---

## 🧑‍💻 개발 환경

- Xcode 15.0
- Swift 5.9
- iOS 17 Simulator
- UIKit 기반
- CoreData를 통한 로컬 데이터 저장

---

## 🌱 향후 업데이트 계획

- 감정별 그래프 분석 (예: 막대그래프)
- 사용자 사진 추가 기능
- 클라우드 동기화 (Firebase 예정)

---
## 앱 실행 화면

![Simulator Screenshot - iPhone 16 Pro - 2025-06-17 at 14 10 55](https://github.com/user-attachments/assets/bfa4e302-9726-44ea-ab06-85afef224e6d)
![Simulator Screenshot - iPhone 16 Pro - 2025-06-17 at 14 10 55](https://github.com/user-attachments/assets/bfa4e302-9726-44ea-ab06-85afef224e6d)
앱을 실행시키면 나타나는 첫 화면입니다.

![Simulator Screenshot - iPhone 16 Pro - 2025-06-17 at 14 11 13](https://github.com/user-attachments/assets/8376789b-4294-4475-b8f4-bda3a9f0b488)
![Simulator Screenshot - iPhone 16 Pro - 2025-06-17 at 14 11 13](https://github.com/user-attachments/assets/8376789b-4294-4475-b8f4-bda3a9f0b488)
원하는 날짜를 선택할 수 있습니다.

![Simulator Screenshot - iPhone 16 Pro - 2025-06-17 at 14 11 17](https://github.com/user-attachments/assets/baa1d06f-d1b7-4b77-93a5-60b5234bbfeb)
![Simulator Screenshot - iPhone 16 Pro - 2025-06-17 at 14 11 17](https://github.com/user-attachments/assets/baa1d06f-d1b7-4b77-93a5-60b5234bbfeb)
일기작성을 누르면 뜨는 화면입니다. 하단에서 오늘의 감정을 선택할 수 있고 하단의 버튼을 통해 사진도 추가할 수 있습니다.

![Simulator Screenshot - iPhone 16 Pro - 2025-06-17 at 14 11 25](https://github.com/user-attachments/assets/6e5a50e1-3931-4e48-8b97-9e4afdb7523c)
![Simulator Screenshot - iPhone 16 Pro - 2025-06-17 at 14 11 25](https://github.com/user-attachments/assets/6e5a50e1-3931-4e48-8b97-9e4afdb7523c)
![Simulator Screenshot - iPhone 16 Pro - 2025-06-17 at 14 11 30](https://github.com/user-attachments/assets/c21ab81e-4c3e-408f-9f58-aed52c3220ee)
![Simulator Screenshot - iPhone 16 Pro - 2025-06-17 at 14 11 30](https://github.com/user-attachments/assets/c21ab81e-4c3e-408f-9f58-aed52c3220ee)
감정을 선택하지 않고 일기를 쓰면 감정을 선택해달라는 경고문구가 뜹니다. 감정을 선택하면 경고문구는 사라지고 오늘의 감정이 나타납니다.
