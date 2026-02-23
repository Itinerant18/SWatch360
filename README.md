# SWatch360 - Flutter ThingsBoard Mobile Application

This is the mobile application for SWatch360, built on the ThingsBoard PE platform.

## 🚀 Environment Setup

### General Requirements
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (matching the version in `pubspec.yaml`)
- A code editor: [Android Studio](https://developer.android.com/studio), [VS Code](https://code.visualstudio.com/), or [IntelliJ IDEA](https://www.jetbrains.com/idea/)

### 🤖 Android Requirements
- [Android Studio](https://developer.android.com/studio) with:
  - Android SDK
  - Android SDK Command-line Tools
  - Android Emulator (optional, for testing)

### 🍎 iOS Requirements (macOS only)
- **A Mac computer** (Required for all iOS build and deployment tasks)
- [Xcode](https://developer.apple.com/xcode/) (Latest stable version)
- [CocoaPods](https://cocoapods.org/) (`sudo gem install cocoapods`)
- Apple Developer Account (Required for code signing and App Store/TestFlight submission)

### 1. Initialize the Project
```bash
# Clone the repository
git clone https://github.com/Itinerant18/SWatch360.git
cd SWatch360

# Install dependencies
flutter pub get

# For iOS (Run this on macOS)
cd ios && pod install && cd ..
```

## 🛠️ Build Instructions

The build commands use the parameters defined in `configs.json` automatically via the `--dart-define-from-file` flag.

### 🧹 Clean and Sync
Before any new build, it is recommended to clean the project:
```bash
flutter clean
flutter pub get
```

### 🤖 Android Builds

#### Build APK (Release)
Generates a release APK for manual distribution.
```bash
flutter build apk --release --dart-define-from-file configs.json
```
**Output Path:** `build/app/outputs/flutter-apk/app-release.apk`

#### Build App Bundle (AAB - Release)
Generates an AAB for submission to the Google Play Store.
```bash
flutter build appbundle --release --dart-define-from-file configs.json
```
**Output Path:** `build/app/outputs/bundle/release/app-release.aab`

---

### 🍎 iOS Builds (macOS only)

#### Build IPA (Release)
Generates an IPA for the App Store or TestFlight.
```bash
flutter build ipa --release --dart-define-from-file configs.json
```
**Output Path:** `build/ios/archive/Runner.xcarchive` (Follow the Xcode instructions to export the `.ipa`)

---

## 🔗 Git Sync & Push

To push your latest workspace changes to GitHub:

```bash
# 1. Stage all changes
git add .

# 2. Commit with a meaningful message
git commit -m "chore: updated configuration and build settings for SWatch360"

# 3. Push to main branch
git push origin main
```

## 📋 Configuration Details
Your `configs.json` contains critical environment variables. Ensure these are kept secure and consistent across builds.

| Key | Value |
| :--- | :--- |
| **App ID** | com.seple.demohestia |
| **App Name** | SWatch 360 |
| **API Endpoint** | https://thingsboard.cloud |
