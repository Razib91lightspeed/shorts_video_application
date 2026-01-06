# 🎬 Shortz — Short Video Sharing App (MVP)

**Shortz** is a cross-platform short-form video sharing application inspired by TikTok.  
It is built with **Flutter** for iOS/macOS and **Firebase** as the backend, focusing on fast onboarding, simplicity, and scalability.

This repository contains an **MVP implementation** intended for early testing, learning, and future expansion.

---

## 🚀 Features (MVP)

### ✅ Authentication
- Phone number signup with OTP (Firebase Auth)
- Optional email login (can be added later)
- Secure and minimal onboarding flow

### ✅ Core Social Features
- Infinite vertical video feed
- Like videos
- Follow / unfollow users
- User profiles
- Basic video metadata storage

### 🚧 Planned / Future
- Comments
- Video upload from camera/gallery
- 1-to-1 messaging
- Video compression & adaptive streaming
- Notifications
- Recommendation algorithm

---

## 🧱 Tech Stack

### Frontend
- **Flutter** (cross-platform)
- Dart
- Material UI (dark-mode first)

### Backend (Firebase)
- **Firebase Authentication** (OTP, email)
- **Cloud Firestore** (users, videos, social graph)
- **Firebase Storage** (video files)

**Why Firebase?**
- Generous free tier (ideal for ≤ 50 users)
- Built-in auth, database, and storage
- Minimal backend setup
- Easy to scale later

---

## 📁 Project Structure

```text
lib/
├── app.dart                 # Root app widget
├── main.dart                # App entry point
├── core/                    # Theme, constants, utilities
├── features/
│   ├── auth/                # Authentication flow
│   ├── feed/                # Video feed
│   ├── create/              # Video upload (placeholder)
│   ├── profile/             # User profile
│   └── messages/            # Messaging (MVP placeholder)
├── services/
│   ├── auth_service.dart
│   ├── firestore_service.dart
│   └── storage_service.dart
└── widgets/                 # Reusable UI components

```
