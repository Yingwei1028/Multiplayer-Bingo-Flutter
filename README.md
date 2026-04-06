# Multiplayer Bingo - Flutter & Firebase 🎲

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A real-time multiplayer Bingo game built with **Flutter** and **Firebase Realtime Database**. This project demonstrates the implementation of synchronized game states across multiple devices, room-based matchmaking, and automated win-condition logic.

## 🌟 Key Features

* **Real-time Synchronization**: Seamlessly syncs game moves and marked numbers across all players using Firebase's web-socket-based listeners.
* **Room Management**: Supports creating and joining specific game rooms via unique codes for private matches.
* **Dynamic Board Generation**: Each player starts with a randomized 5x5 Bingo grid.
* **Automated Win Detection**: An efficient algorithm that checks for horizontal, vertical, and diagonal Bingo lines in real-time.
* **Cross-Platform**: Designed to provide a smooth experience on both Android and iOS devices.

## 🛠️ Tech Stack

* **Frontend**: Flutter (Dart)
* **Backend**: Firebase Realtime Database
* **Architecture**: Stream-based State Management

## 📸 Screenshots (Optional)

| Home Screen | Game Lobby | In-Game Board |
| :---: | :---: | :---: |
| *Add screenshot here* | *Add screenshot here* | *Add screenshot here* |

## 🚀 Getting Started

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) installed on your machine.
* A Firebase project configured for both Android and iOS.

### Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/Yingwei1028/Multiplayer-Bingo-Flutter.git](https://github.com/Yingwei1028/Multiplayer-Bingo-Flutter.git)
    cd Multiplayer-Bingo-Flutter
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Firebase Configuration:**
    * Create a project in the [Firebase Console](https://console.firebase.google.com/).
    * Register your Android/iOS apps.
    * Download and place `google-services.json` in `android/app/`.
    * Download and place `GoogleService-Info.plist` in `ios/Runner/`.

4