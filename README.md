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

---

Let me know if you'd like to adjust anything else!
