# flutter_final_exam

Sure! Here's the README description with some emojis added to make it more visually appealing:

---

# 🗓️ Daily Habit Tracker App

This is a mobile application designed to help users track their daily habits, set reminders, and visualize progress over time. It uses **SQLite** for local data storage, **Firebase** for cloud synchronization and backup, and supports offline data management. 📱

## ✨ Features

### Enhanced Habit Management with SQLite 📚
- **Habit Fields**: Habit Name, Category (e.g., Health, Work, Personal), Target Days, Reminder Time, and Progress (Completed/Not Completed). ✅
- **CRUD Operations**:
  - **Create**: Add new habits with categories and reminder times. ➕
  - **Read**: View all habits grouped by category. 👀
  - **Update**: Modify habit details like target days and reminder time. ✏️
  - **Delete**: Remove habits when no longer needed. ❌

### 🔄 Firebase Sync and Backup
- **Firebase Authentication**: Users can create and manage accounts using email and password. 🔐
- **Sync with Firestore**: Habit data is uploaded and updated to Firestore. When the app goes online, it syncs the local data with Firebase. 🌐
- **Offline Sync**: The app works offline and syncs data to Firebase when internet connection is restored. 📶

### 📈 Progress and Reminders
- **Track Progress**: Habits can be tracked with daily completion status (e.g., X/7 days completed). 🏅
- **Reminders**: Users receive notifications for pending habits if reminders are set. ⏰

### 🛠️ Offline Data Management & Sync
- The app allows full offline functionality using SQLite. When the device is online, it syncs habit data with Firebase to ensure everything is up-to-date. 📡

### 🎨 UI Design
- **User-Friendly Interface**: The app features an intuitive layout with habits displayed in a categorized ListView. A Floating Action Button (FAB) is used to add new habits. 📋
- **Visual Progress Indicators**: Habit completion is visually shown through progress bars or percentage indicators, and different colors/icons represent completed vs. pending habits. 🌈

## 📸 Screenshots

*(Insert screenshots of your app here)*

## 🛠️ Installation

To run this project on your local machine, follow the steps below:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/daily-habit-tracker-app.git
   ```

2. **Install dependencies**:
   Ensure you have **Android Studio** or a similar IDE set up for **Flutter** (or your preferred mobile development platform). Then, run:
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**:
   Follow the Firebase setup guide for your platform (iOS or Android) and configure Firebase Authentication, Firestore, and Firebase Cloud Messaging.






<p>
  <img src="https://github.com/user-attachments/assets/90e277ca-30b3-4536-8b1e-f5e28096a156" width="22%" Height="35%">
    <img src="https://github.com/user-attachments/assets/fde6d13d-842a-4318-a9ef-0d04240ed8ad" width="22%" Height="35%">
      <img src="https://github.com/user-attachments/assets/a7266a66-2f24-4dec-b052-6a6dd8ddf3bc" width="22%" Height="35%">
        <img src="https://github.com/user-attachments/assets/5b2fa93f-12c1-49e2-809c-381690c06987" width="22%" Height="35%">
<img src="https://github.com/user-attachments/assets/8a43df15-06fc-4e11-b1af-6b2bb979085dl̥" width="22%" Height="35%">
            <img src="https://github.com/user-attachments/assets/b0e9de84-6012-4194-b83b-4d4b0b606bde" width="22%" Height="35%">
                <img src="https://github.com/user-attachments/assets/5e621f01-1851-4fc5-b866-8d1cb536f697" width="22%" Height="35%">
                 <img src="https://github.com/user-attachments/assets/2b62ae22-265c-4531-897a-fe64ecc8e0cb" width="22%" Height="35%">
</p>
