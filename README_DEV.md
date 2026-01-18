# Maharat App - Developer Guide

## 🏗️ Project Structure

The project follows Clean Architecture principles with BLoC pattern for state management.

```
lib/
├── app.dart                    # App widget with theme and routing
├── main.dart                   # Entry point
├── core/
│   ├── constants/             # App-wide constants
│   │   ├── app_colors.dart    # Color palette
│   │   ├── app_strings.dart   # Arabic strings
│   │   └── app_assets.dart    # Asset paths
│   ├── theme/
│   │   └── app_theme.dart     # Material 3 theme with Cairo font
│   ├── router/
│   │   └── app_router.dart    # GoRouter configuration
│   ├── utils/
│   │   ├── validators.dart    # Form validators
│   │   └── helpers.dart       # Helper functions
│   └── di/
│       └── injection_container.dart  # Dependency injection setup
├── features/
│   ├── splash/               # Splash screen with animations
│   ├── onboarding/           # 3-page onboarding
│   └── auth/                 # Authentication feature
│       ├── data/             # Data layer (models, repositories)
│       ├── domain/           # Domain layer (entities, contracts)
│       └── presentation/     # Presentation layer (BLoC, screens, widgets)
└── shared/
    └── widgets/              # Reusable widgets
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK >=3.2.0
- Dart SDK >=3.2.0

### Installation

1. Clone the repository:
```bash
git clone https://github.com/alimuthana222/new-flutter-app.git
cd new-flutter-app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 🎨 Features Implemented

### Part 1: Core & Auth

- ✅ Splash screen with animations
- ✅ Onboarding (3 pages)
- ✅ Login screen
- ✅ Register screen
- ✅ OTP verification screen
- ✅ Forgot password screen
- ✅ Complete theme system (Material 3 + Cairo font)
- ✅ RTL support
- ✅ Clean Architecture + BLoC pattern
- ✅ Form validation
- ✅ Shared widgets (button, text field, loading, error)

## 🏛️ Architecture

### Clean Architecture Layers

1. **Presentation Layer**
   - BLoC for state management
   - Screens (UI)
   - Widgets (reusable components)

2. **Domain Layer**
   - Entities (pure business objects)
   - Repository interfaces
   - Use cases (business logic)

3. **Data Layer**
   - Models (data representations)
   - Repository implementations
   - Data sources (API, local storage)

### BLoC Pattern

All features use BLoC (Business Logic Component) for state management:
- Events: User actions
- States: UI states
- BLoC: Business logic processing events and emitting states

## 📱 Screens Flow

```
Splash Screen
    ↓
Onboarding (first time) / Login (returning user)
    ↓
Login Screen ←→ Register Screen
    ↓                ↓
  Home          OTP Verification
                     ↓
                   Home
```

## 🎨 Design System

### Colors
- Primary: Indigo (#6366F1)
- Secondary: Teal (#14B8A6)
- Accent: Amber (#F59E0B)

### Typography
- Font: Cairo (Google Fonts)
- Material 3 text styles

### Components
- Custom buttons (primary, outlined, with loading states)
- Custom text fields (with validation, icons, password toggle)
- Loading widgets
- Error widgets

## 🔧 Configuration

### Dependencies
- **State Management**: flutter_bloc, equatable
- **DI**: get_it
- **Navigation**: go_router
- **UI**: google_fonts, flutter_animate, shimmer
- **Storage**: shared_preferences, flutter_secure_storage
- **Forms**: flutter_form_builder, form_builder_validators

## 📝 Coding Standards

- All UI text in Arabic
- RTL direction
- Cairo font for all text
- Clean code with proper documentation
- Handle all edge cases
- Responsive design

## 🧪 Testing

To run tests:
```bash
flutter test
```

## 🔨 Building

### Debug build
```bash
flutter run
```

### Release build
```bash
flutter build apk --release  # Android
flutter build ios --release  # iOS
```

## 📄 License

MIT License
