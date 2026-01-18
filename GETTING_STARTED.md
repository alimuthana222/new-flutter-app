# 🚀 Getting Started with Maharat App

## Prerequisites

Before running the Maharat app, ensure you have:

1. **Flutter SDK** installed (version 3.2.0 or higher)
   ```bash
   flutter --version
   ```

2. **Android Studio** or **VS Code** with Flutter extensions

3. **Android Emulator** or **iOS Simulator** (or physical device)

## Installation Steps

### 1. Install Dependencies

Navigate to the project directory and run:

```bash
flutter pub get
```

This will download all the required packages specified in `pubspec.yaml`.

### 2. Verify Installation

Check if Flutter can detect your devices:

```bash
flutter devices
```

### 3. Run the App

Launch the app on your connected device/emulator:

```bash
flutter run
```

Or for a specific device:

```bash
flutter run -d <device_id>
```

## 📱 App Navigation Flow

When you first run the app, you'll experience:

1. **Splash Screen** (2.5 seconds)
   - Beautiful animated logo
   - App name and slogan

2. **Onboarding** (First time only)
   - 3 informative pages
   - Skip button available
   - Swipe or tap "Next"

3. **Login Screen**
   - Enter credentials (or mock login)
   - Link to registration

4. **Main Screen** (After login)
   - **Home Tab**: View time bank balance, search skills, browse featured skills
   - **Skills Tab**: Manage your skills (placeholder)
   - **Messages Tab**: View conversations (placeholder)
   - **Profile Tab**: View profile, settings, logout

## 🎯 Quick Actions

### Skip Onboarding
Tap the "تخطي" (Skip) button at the top-right during onboarding.

### Mock Login
The login screen accepts any email/password for testing purposes.

### Navigate Skill Details
From the Home tab, tap any skill card to view details.

### Test Chat
Skill detail pages and other features link to chat screens.

### Logout
Go to Profile tab → Tap "تسجيل الخروج" (Logout)

## 🎨 UI Features to Explore

- **Animated Splash**: Watch the logo scale and shake
- **Onboarding Animations**: Pulsing circles with floating icons
- **Time Bank Card**: Beautiful gradient wallet display
- **RTL Layout**: All text flows right-to-left (Arabic)
- **Bottom Navigation**: Smooth tab transitions
- **Custom Widgets**: Consistent buttons and text fields

## 🔧 Development Tips

### Hot Reload
Press `r` in the terminal while the app is running to hot reload.

### Debug Mode
The app runs in debug mode by default, showing the debug banner.

### Change Language/Locale
Currently set to Arabic (`ar`). Modify in `lib/app.dart` if needed.

### Modify Colors
Edit `lib/core/constants/app_colors.dart` to change the color scheme.

### Add New Routes
Update `lib/core/router/app_router.dart` to add navigation routes.

## 📂 Key Files to Know

- `lib/main.dart` - App entry point
- `lib/app.dart` - MaterialApp configuration
- `lib/core/theme/app_theme.dart` - Theme customization
- `lib/core/constants/app_strings.dart` - All text strings
- `lib/core/constants/app_colors.dart` - Color palette

## 🐛 Troubleshooting

### Dependencies Not Found
```bash
flutter pub get
flutter clean
flutter pub get
```

### Build Issues
```bash
flutter clean
flutter pub cache repair
flutter pub get
```

### Emulator Not Starting
```bash
flutter emulators
flutter emulators --launch <emulator_id>
```

## 🎓 Learning Resources

- **Flutter Docs**: https://docs.flutter.dev
- **go_router Package**: https://pub.dev/packages/go_router
- **flutter_animate**: https://pub.dev/packages/flutter_animate
- **Google Fonts**: https://pub.dev/packages/google_fonts

## 📝 Next Steps

After exploring the app, consider:

1. Integrating Supabase backend
2. Implementing BLoC state management
3. Adding Firebase notifications
4. Creating real skill data models
5. Building the booking system

## 🤝 Need Help?

If you encounter issues:
1. Check the Flutter documentation
2. Review the IMPLEMENTATION_SUMMARY.md
3. Examine the code comments in each file

Happy coding! 🎉
