# SkillMirror

**SkillMirror** is a Flutter-based mobile application that helps users **analyze their skills** for a particular role and get **suggestions for improvement**. It calculates a **readiness score** based on selected skills and recommends missing skills dynamically from Firebase.  

---

## 🔹 Features

- **Skill Selection:** Users can select their known skills from a predefined list or fetch from Firebase.  
- **Score Calculation:** Calculates a skill score as a percentage based on matched skills.  
- **Suggested Skills:** Recommends skills to learn based on missing skills from the role.  
- **Animated Score Circle:** Displays a visually appealing circular progress indicator for the score.  
- **Firebase Integration:** Dynamic skill lists that can be updated in real-time without changing the app code.  
- **Multiple Roles Support:** Can be extended to support Full Stack, Cloud Engineer, or any other role.  

---

## 🖥 Screenshots

![WhatsApp Image 2025-08-20 at 01 46 20_8c3e18ee](https://github.com/user-attachments/assets/3851f674-d8c9-4054-a711-2a3e4f2bfa75)

![WhatsApp Image 2025-08-20 at 01 46 22_cad80bea](https://github.com/user-attachments/assets/5c74d59d-e8c6-4566-bb82-d2d848308c9d)

![WhatsApp Image 2025-08-20 at 01 46 22_99834c12](https://github.com/user-attachments/assets/9a3c630a-4a12-428c-ade9-320013e75818)

![WhatsApp Image 2025-08-20 at 01 46 22_271786d3](https://github.com/user-attachments/assets/82a34acc-8b65-4b97-a523-5bfe18213bd5)

---

## ⚙️ Tech Stack


- **Frontend:** Flutter  
- **Backend:** Firebase Firestore  
- **Language:** Dart  
- **Other:** CircularProgressIndicator, Chip widgets, Stack & Blur effects  

---

## 📁 Project Structure

lib/
├─ main.dart
├─ screens/
│ └─ score_screen.dart
├─ models/
├─ services/
│ └─ firebase_service.dart
└─ widgets/



- **main.dart:** Entry point of the app.  
- **score_screen.dart:** Shows score, selected skills, and suggested skills.  
- **firebase_service.dart:** Handles fetching skills from Firebase.  

---

## ⚡ How to Run

1. Clone the repository:
```bash
git clone https://github.com/sandra-simon/SkillMirror.git
cd skillmirror_app
flutter pub get
flutter run

