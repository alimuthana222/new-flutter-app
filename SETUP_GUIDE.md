# 🚀 Quick Setup Guide

## Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK**: Version 3.2.0 or higher
- **Dart SDK**: Version 3.2.0 or higher
- **IDE**: VS Code or Android Studio
- **Git**: For version control

## Installation Steps

### 1. Clone the Repository

```bash
git clone https://github.com/alimuthana222/new-flutter-app.git
cd new-flutter-app
```

### 2. Install Flutter Dependencies

```bash
flutter pub get
```

This will download all the required packages specified in `pubspec.yaml`.

### 3. Verify Flutter Installation

```bash
flutter doctor
```

Make sure all checks pass. If not, follow the instructions provided by Flutter Doctor.

## Running the App

### Development Mode

```bash
flutter run
```

This will launch the app on your connected device or emulator.

### Hot Reload

While the app is running, you can use hot reload:
- Press `r` in the terminal for hot reload
- Press `R` for hot restart
- Press `q` to quit

### Run on Specific Device

```bash
# List all devices
flutter devices

# Run on specific device
flutter run -d <device-id>
```

## Building the App

### Android

```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle (for Play Store)
flutter build appbundle --release
```

### iOS

```bash
# Debug build
flutter build ios --debug

# Release build
flutter build ios --release
```

## Project Structure Quick Reference

```
lib/
├── main.dart          # App entry point
├── app.dart           # App configuration
├── core/              # Core functionality
├── features/          # Feature modules
│   ├── splash/        # Splash screen
│   ├── onboarding/    # Onboarding flow
│   └── auth/          # Authentication
└── shared/            # Shared components
```

## Testing

### Run All Tests

```bash
flutter test
```

### Run Specific Test File

```bash
flutter test test/path/to/test_file.dart
```

### Code Coverage

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Code Quality

### Format Code

```bash
flutter format .
```

### Analyze Code

```bash
flutter analyze
```

### Fix Common Issues

```bash
dart fix --apply
```

## Common Commands

### Clean Build

```bash
flutter clean
flutter pub get
```

### Update Dependencies

```bash
flutter pub upgrade
```

### Generate Code (for build_runner)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Troubleshooting

### Issue: Dependencies not found
**Solution**: Run `flutter pub get` and restart your IDE

### Issue: Build errors after git pull
**Solution**: 
```bash
flutter clean
flutter pub get
flutter run
```

### Issue: iOS build fails
**Solution**:
```bash
cd ios
pod install
cd ..
flutter run
```

### Issue: Hot reload not working
**Solution**: Press `R` for hot restart instead of `r`

## IDE Setup

### VS Code

Install these extensions:
- Flutter
- Dart
- Dart Data Class Generator
- Better Comments
- GitLens

### Android Studio

Install these plugins:
- Flutter
- Dart
- Rainbow Brackets
- Material Theme UI

## Recommended VS Code Settings

Create `.vscode/settings.json`:

```json
{
  "dart.lineLength": 80,
  "editor.formatOnSave": true,
  "editor.rulers": [80],
  "dart.debugExternalPackageLibraries": false,
  "dart.debugSdkLibraries": false
}
```

## Recommended VS Code Launch Configuration

Create `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter: Run",
      "type": "dart",
      "request": "launch",
      "program": "lib/main.dart"
    },
    {
      "name": "Flutter: Run (Profile)",
      "type": "dart",
      "request": "launch",
      "program": "lib/main.dart",
      "flutterMode": "profile"
    }
  ]
}
```

## Git Workflow

### Create a New Feature Branch

```bash
git checkout -b feature/your-feature-name
```

### Commit Changes

```bash
git add .
git commit -m "feat: add your feature description"
```

### Push to Remote

```bash
git push origin feature/your-feature-name
```

### Create Pull Request

Go to GitHub and create a pull request from your feature branch.

## Development Tips

1. **Use const constructors** wherever possible to improve performance
2. **Hot reload** frequently to see changes instantly
3. **Use the debugger** instead of print statements
4. **Write tests** for critical functionality
5. **Follow the architecture** - keep features isolated
6. **Use meaningful names** for variables and functions
7. **Document complex logic** with comments
8. **Keep files small** - split large files into smaller ones

## Useful Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [BLoC Pattern](https://bloclibrary.dev/)
- [Material Design 3](https://m3.material.io/)
- [Go Router](https://pub.dev/packages/go_router)

## Getting Help

- Check the documentation files: `README_DEV.md`, `TECHNICAL_DOCS.md`
- Review the code comments and examples
- Search existing GitHub issues
- Create a new issue if you find a bug
- Ask questions in the team chat/Slack

## Environment Variables (Future Use)

Create a `.env` file in the root directory:

```env
# Supabase
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key

# Firebase
FIREBASE_API_KEY=your_firebase_api_key
FIREBASE_APP_ID=your_firebase_app_id
```

**Note**: Never commit `.env` files to version control!

## Performance Optimization

### Enable Performance Overlay

```bash
flutter run --profile
```

Then in the app, press `P` to toggle performance overlay.

### Analyze App Size

```bash
flutter build apk --analyze-size
```

### Check for Memory Leaks

Use Flutter DevTools to monitor memory usage and detect leaks.

## Continuous Integration (Future)

The project is ready for CI/CD setup with:
- GitHub Actions
- Codemagic
- Bitrise

## Support

For issues and questions:
- Email: support@maharat.app
- GitHub Issues: [Create an issue](https://github.com/alimuthana222/new-flutter-app/issues)

---

**Happy Coding! 🎉**

Remember: Write clean code, test thoroughly, and have fun building Maharat!
