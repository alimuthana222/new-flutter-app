# Maharat App - Technical Documentation

## Overview

Maharat is a skill exchange mobile application built with Flutter, targeting Iraqi university students. It uses a time banking system where 1 hour of teaching equals 1 hour of learning.

## Key Features

### 1. Authentication System
- Email/password login
- User registration with university verification
- OTP verification via email
- Password reset functionality
- Social login (Google) - prepared for implementation

### 2. User Profile
- Full name, username, email
- Phone number (Iraqi format: 07XXXXXXXXX)
- University affiliation
- Profile photo
- Bio
- Time balance (hours earned/spent)

### 3. RTL Support
- Complete right-to-left interface
- Arabic language throughout
- Cairo font for optimal Arabic text rendering

## Architecture Details

### Clean Architecture

The project follows Uncle Bob's Clean Architecture principles:

```
┌─────────────────────────────────────┐
│         Presentation Layer          │
│  (UI, BLoC, Widgets, Screens)      │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│          Domain Layer               │
│  (Entities, Repository Interfaces)  │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│           Data Layer                │
│  (Models, Repository Impl, API)     │
└─────────────────────────────────────┘
```

### State Management: BLoC Pattern

Each feature has its own BLoC with:
- **Events**: User actions (LoginEvent, RegisterEvent, etc.)
- **States**: UI states (Loading, Success, Error, etc.)
- **BLoC**: Business logic processor

Example: Auth BLoC
```dart
LoginEvent → AuthBloc → [Loading, Authenticated/Error]
```

### Dependency Injection

Using GetIt for dependency injection:
- Repositories registered as lazy singletons
- BLoCs registered as factories
- External dependencies (SharedPreferences, SecureStorage)

## File Organization

### Core Module
Contains app-wide functionality:
- **Constants**: Colors, strings, assets
- **Theme**: Material 3 theme configuration
- **Router**: Navigation setup
- **Utils**: Validators, helpers
- **DI**: Dependency injection container

### Features Module
Each feature is self-contained with:
- **Data**: Models, repository implementations
- **Domain**: Entities, repository interfaces
- **Presentation**: BLoC, screens, widgets

### Shared Module
Reusable components across features:
- Custom widgets (buttons, text fields)
- Loading and error states
- Common utilities

## Validation System

### Email Validation
- Required field check
- Format validation (RFC 5322 compliant)

### Password Validation
- Minimum 8 characters
- Required field check

### Phone Validation
- Iraqi format: 07[3-9]XXXXXXXX
- 11 digits starting with 07

### Name Validation
- Minimum 2 characters
- Required field check

## Navigation

Using GoRouter for type-safe navigation:
```dart
Routes:
  / - Splash Screen
  /onboarding - Onboarding
  /login - Login
  /register - Register
  /otp - OTP Verification
  /forgot-password - Password Reset
```

## Theme System

### Material 3 Design
- Color schemes with semantic naming
- Component themes (buttons, inputs, cards)
- Typography with Cairo font
- RTL-aware spacing and alignment

### Color Palette
```dart
Primary: #6366F1 (Indigo)
  - Light: #818CF8
  - Dark: #4F46E5
  - Container: #E0E7FF

Secondary: #14B8A6 (Teal)
  - Light: #2DD4BF
  - Dark: #0D9488
  - Container: #CCFBF1

Accent: #F59E0B (Amber)

Semantic Colors:
  - Success: #10B981
  - Warning: #F59E0B
  - Error: #EF4444
  - Info: #3B82F6
```

## Data Flow

### Login Flow
```
User enters credentials
     ↓
LoginEvent dispatched to AuthBloc
     ↓
AuthBloc calls AuthRepository.login()
     ↓
AuthRepositoryImpl performs authentication
     ↓
User entity returned
     ↓
Authenticated state emitted
     ↓
UI updates (navigate to home)
```

### Register Flow
```
User fills registration form
     ↓
RegisterEvent dispatched
     ↓
AuthRepository.register() called
     ↓
User created, OTP sent
     ↓
OtpSent state emitted
     ↓
Navigate to OTP screen
     ↓
User enters OTP
     ↓
VerifyOtpEvent dispatched
     ↓
OTP verified, user authenticated
     ↓
Navigate to home
```

## Storage Strategy

### SharedPreferences
- User preferences
- First-time app launch flag
- Login status
- Non-sensitive data

### FlutterSecureStorage
- User tokens
- Sensitive user data
- Authentication credentials

## Error Handling

All operations include try-catch blocks:
```dart
try {
  // Operation
  emit(SuccessState());
} catch (e) {
  emit(ErrorState(message: e.toString()));
}
```

## Animation System

Using flutter_animate for smooth animations:
- Splash screen: Scale, shimmer effects
- Onboarding: Fade-in transitions
- Screen transitions: Slide animations

## Future Enhancements (Not in Part 1)

- Home screen with skill listings
- Skill creation and management
- Booking system
- Real-time chat
- Video calls integration
- Payment system (ZainCash, Ki-Card)
- Reviews and ratings
- Time bank wallet management
- Notifications
- Search and filtering

## Development Guidelines

### Code Style
- Use const constructors where possible
- Prefer single quotes for strings
- Sort child properties last
- Avoid print statements (use debugPrint)

### Naming Conventions
- Classes: PascalCase
- Files: snake_case
- Variables: camelCase
- Constants: camelCase with 'k' prefix or all caps for static const

### Git Workflow
- Feature branches for new features
- Descriptive commit messages
- Pull requests for code review

## Testing Strategy

### Unit Tests
- BLoC tests for business logic
- Repository tests
- Utility function tests

### Widget Tests
- Screen layouts
- Widget interactions
- Form validations

### Integration Tests
- Complete user flows
- Navigation tests
- Authentication flows

## Performance Considerations

- Lazy loading of images
- Cached network images
- Minimal widget rebuilds
- Efficient state management
- Proper disposal of resources

## Security Measures

- Secure storage for sensitive data
- Input validation on all forms
- No hardcoded credentials
- HTTPS for all network calls
- Token-based authentication

## Accessibility

- Semantic labels for screen readers
- Sufficient color contrast
- Touch target sizes ≥ 44x44
- Keyboard navigation support
- RTL layout support

## Localization

Currently supporting:
- Arabic (ar_IQ) - Primary language
- RTL text direction
- Arabic number formatting
- Arabic date/time formatting

## Build Configuration

### Development
```bash
flutter run --debug
```

### Production
```bash
flutter build apk --release --obfuscate --split-debug-info=symbols/
```

## Monitoring and Analytics

Prepared for:
- Firebase Analytics
- Crashlytics for error reporting
- Performance monitoring
- User behavior tracking

## API Integration (Future)

Prepared for Supabase integration:
- Authentication endpoints
- Real-time subscriptions
- Database operations
- File storage

## Conclusion

This is Part 1 of the Maharat app, implementing the core foundation and authentication system. The architecture is designed to be scalable and maintainable, following Flutter best practices and clean code principles.
