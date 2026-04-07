# SWatch360

Flutter ThingsBoard mobile application.

## Screenshots

<p float="left">
  <img src="https://github.com/user-attachments/assets/bbe48a25-a856-4800-bda5-545ca4de2d17" width="30%" />
  <img src="https://github.com/user-attachments/assets/c0318a27-775f-4354-b40f-19d1ea26ca98" width="30%" />
  <img src="https://github.com/user-attachments/assets/2875bb54-a50b-4146-b9fb-cee1ff1ad510" width="30%" />
</p>

## Project Snapshot

- Flutter app version: `1.7.0+9`
- Dart SDK constraint: `^3.7.0`
- iOS Podfile platform: `iOS 15.0`
- Runner iOS deployment target in project settings: `15.6`
- Main release archive command:

```bash
flutter build ipa --release --dart-define-from-file configs.json
```

## Requirements

### General

- Flutter SDK installed and on PATH
- Xcode + CocoaPods for iOS
- Android Studio/SDK for Android

### iOS (macOS only)

- Xcode (recent stable)
- CocoaPods
- Apple Developer team/signing profile configured in Xcode

## Setup

```bash
git clone https://github.com/Itinerant18/SWatch360.git
cd SWatch360

flutter pub get

# iOS only
cd ios
pod install
cd ..
```

## Build

### Android APK

```bash
flutter build apk --release --dart-define-from-file configs.json
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle (Play Store)

```bash
flutter build appbundle --release --dart-define-from-file configs.json
```

Output: `build/app/outputs/bundle/release/app-release.aab`

### iOS IPA (App Store/TestFlight)

```bash
flutter build ipa --release --dart-define-from-file configs.json
```

Outputs:

- Archive: `build/ios/archive/Runner.xcarchive`
- IPA: `build/ios/ipa/*.ipa`

## iOS Archive Runbook (Important)

If archive fails, use this exact order.

1. Clean Flutter and dependency state:

```bash
flutter clean
flutter pub get
cd ios && pod install && cd ..
```

2. Ensure these iOS project conditions are true:

- `ENABLE_USER_SCRIPT_SANDBOXING = NO` in Runner build configs
- `StoreKit.framework` is linked in Frameworks, but not embedded in "Embed Frameworks"
- Pod post-install has compatibility overrides:
  - `ENABLE_MODULE_VERIFIER = NO`
  - `CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = NO`

3. Re-run archive:

```bash
flutter build ipa --release --dart-define-from-file configs.json
```

## Disk Space Failure Fix (Very Common)

If you see errors like:

- `No space left on device (28)`
- `Mkdtemp(...) No space left on device`
- `error writing ... ExplicitPrecompiledModules ...`

free Xcode and build caches:

```bash
rm -rf ~/Library/Developer/Xcode/DerivedData/*
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/*
rm -rf build/ios/*
df -h /
```

Then run archive again.

## Warning vs Error (How to Read Logs)

These are usually warnings and do not block archive:

- Deprecation warnings in Pods/plugins (`deepLinkURLScheme`, `SFAuthenticationSession`, etc.)
- iOS deployment target warnings from third-party pods
- `Run Script will be run during every build` notes

These are blockers and must be fixed:

- Dart compile errors in `lib/...`
- `No space left on device`
- Framework packaging errors (for example embedded system framework issues)

## Configuration

Builds rely on `configs.json` via `--dart-define-from-file`.

Current config highlights:

- API endpoint: `https://thingsboard.cloud`
- Android application id: `com.seple.demohestia`
- App display name: `SWatch 360`

Security note:

- Do not expose production secrets in public repos.
- Prefer CI secrets/environment injection for sensitive values.
