# وصل إيمان | Wasl Iman

Premium, Arabic-first Islamic Flutter app designed to help Muslims stay consistent in worship through a calm and elegant experience.

## Vision

`وصل إيمان` is built as a fully free app for Allah's sake:
- No subscriptions
- No paid plans
- No locked features

## Features

- Arabic-first with full RTL support and English secondary language
- Splash and onboarding flow
- Elegant Home dashboard
- Morning Adhkar and Evening Adhkar with repetition counters
- Prayer Times screen with API-ready service abstraction
- Digital Tasbeeh with phrase selection and persistent counter
- Daily Quran Wird goal and progress tracking
- Daily Worship Tracker (prayers + adhkar + Quran)
- Settings (language switch, theme toggle placeholder, notifications placeholder)
- About screen and privacy-first local data note
- Local persistence using `shared_preferences`
- Clean architecture with reusable widgets and scalable structure

## Tech Stack

- Flutter (Dart)
- Provider (state management)
- Shared Preferences (local storage)
- Google Fonts (Cairo for premium Arabic readability)

## Project Structure

```text
wasl_iman/
├── .github/
│   └── workflows/
│       └── build-ios.yml
├── android/
├── ios/
│   ├── Podfile
│   └── Runner/...
├── assets/
│   ├── data/
│   ├── icons/
│   └── images/
├── lib/
│   ├── app.dart
│   ├── main.dart
│   ├── core/
│   │   ├── constants/
│   │   ├── router/
│   │   └── theme/
│   ├── data/
│   │   ├── models/
│   │   └── services/
│   ├── localization/
│   └── presentation/
│       ├── providers/
│       ├── screens/
│       └── widgets/
├── test/
├── pubspec.yaml
└── README.md
```

## Getting Started

1. Install Flutter SDK
2. Clone repo
3. Run:

```bash
flutter pub get
flutter run
```

## Build

### Android APK/AAB

```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS IPA (no code signing)

```bash
flutter build ipa --release --no-codesign
```

## iOS Support Notes

- iOS folder is included and configured.
- `ios/Podfile` is included for CocoaPods integration.
- GitHub Actions workflow builds an unsigned IPA artifact.

## CI/CD

Workflow file:

- `.github/workflows/build-ios.yml`

Pipeline steps:
- macOS runner
- Flutter setup
- `flutter pub get`
- `flutter build ipa --release --no-codesign`
- Upload IPA artifact

## Backend-Ready Architecture

Version 1 is local-only by design. Services are separated (`data/services`) so API or backend integration can be introduced later without major UI refactor.

## License

Private/internal by default. Update as needed before publishing.
