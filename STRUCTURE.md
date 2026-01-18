# Maharat App - Project Structure

## 📁 Directory Structure

```
maharat/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── app.dart                     # MaterialApp configuration with RTL
│   ├── core/                        # Core functionality
│   │   ├── constants/
│   │   │   ├── app_colors.dart     # Color palette (Indigo/Teal)
│   │   │   └── app_strings.dart    # Arabic strings
│   │   ├── router/
│   │   │   └── app_router.dart     # go_router configuration
│   │   └── theme/
│   │       └── app_theme.dart      # Material 3 theme with Cairo font
│   ├── shared/                      # Shared widgets
│   │   └── widgets/
│   │       ├── custom_button.dart
│   │       └── custom_text_field.dart
│   └── features/                    # Feature modules
│       ├── splash/
│       │   └── presentation/screens/splash_screen.dart
│       ├── onboarding/
│       │   └── presentation/
│       │       ├── screens/onboarding_screen.dart
│       │       └── widgets/onboarding_page.dart
│       ├── auth/
│       │   └── presentation/screens/
│       │       ├── login_screen.dart
│       │       └── register_screen.dart
│       ├── main/
│       │   └── presentation/screens/main_screen.dart  # Bottom nav with 4 tabs
│       ├── skills/
│       │   └── presentation/screens/skill_detail_screen.dart
│       └── chat/
│           └── presentation/screens/chat_screen.dart
├── assets/
│   ├── images/
│   ├── icons/
│   └── animations/
└── pubspec.yaml
```

## 🎨 Design System

### Colors
- **Primary**: Indigo (#6366F1)
- **Secondary**: Teal (#14B8A6)
- **Accent**: Amber (#F59E0B)

### Typography
- **Font**: Cairo (Google Fonts)
- **Language**: Arabic (RTL)

## 🧭 Navigation Flow

```
Splash Screen
    ↓
First Time? → Onboarding → Login → Register
    ↓                         ↓
    No                    Main Screen
    ↓                         ↓
Logged In? → Login      (4 Tabs: Home, Skills, Messages, Profile)
    ↓                         ↓
Main Screen              Skill Detail / Chat
```

## 📦 Key Dependencies

- `flutter_bloc`: State management
- `go_router`: Navigation
- `google_fonts`: Cairo font
- `flutter_animate`: Animations
- `shared_preferences`: Local storage
- `supabase_flutter`: Backend
- `firebase_messaging`: Notifications

## 🚀 Getting Started

```bash
# Get dependencies
flutter pub get

# Run the app
flutter run
```

## 📝 Features Implemented

✅ Animated splash screen with navigation logic
✅ Beautiful onboarding with 3 pages
✅ Login and registration screens
✅ Main screen with bottom navigation (4 tabs)
✅ Home page with time bank wallet
✅ Skills list and detail views
✅ Chat interface
✅ Profile page with logout
✅ Complete Material 3 theme
✅ RTL support for Arabic
✅ Custom reusable widgets

## 🎯 Next Steps

- Integrate Supabase backend
- Implement BLoC state management
- Add Firebase notifications
- Build skill booking system
- Implement video calling
- Add payment integration
