# Maharat App - Part 2: Implementation Guide

## 🎯 Overview
This document provides a comprehensive guide to the Part 2 implementation of the Maharat Flutter app, focusing on Home, Skills, Profile, Booking, Chat, and Wallet features.

## 📱 App Navigation Structure

```
Main Screen (Bottom Navigation)
├── 🏠 Home Tab
│   ├── Header (Greeting + Avatar + Notifications)
│   ├── Time Bank Balance Card
│   ├── Search Bar
│   ├── Categories Section (10 categories)
│   ├── Featured Skills Section
│   └── New Skills Grid
│
├── 📚 Skills Tab
│   └── (Placeholder - needs full implementation)
│
├── 💬 Messages Tab
│   └── (Placeholder - needs full implementation)
│
└── 👤 Profile Tab
    ├── Profile Header
    ├── Stats Row
    ├── Edit Profile
    ├── Settings → Settings Screen
    │   ├── Notifications Toggle
    │   ├── Dark Mode Toggle
    │   ├── Language
    │   ├── About → About Screen
    │   ├── Contact Us
    │   ├── Rate App
    │   ├── Share App
    │   └── Delete Account
    └── Logout
```

## 🎨 Implemented Screens

### 1. Home Screen (`home_screen.dart`)
**Location:** `lib/features/home/presentation/screens/home_screen.dart`

**Features:**
- ✅ Pull-to-refresh functionality
- ✅ Custom header with greeting and avatar
- ✅ Clickable time bank balance card (navigates to wallet)
- ✅ Search bar (tap to navigate to search screen)
- ✅ Horizontal scrolling categories (10 categories with icons)
- ✅ Featured skills horizontal carousel
- ✅ New skills grid (2 columns)
- ✅ Smooth animations with flutter_animate

**Navigation:**
- Tap notification bell → `/notifications`
- Tap balance card → `/wallet`
- Tap search bar → `/search` (placeholder)
- Tap category → `/category/:id` (placeholder)
- Tap skill card → `/skill/:id`

**Widgets Used:**
- `HomeHeader` - Custom header component
- `SearchBarWidget` - Tappable search bar
- `CategoriesSection` - Categories carousel
- `CategoryCard` - Individual category card
- `FeaturedSkillsSection` - Featured skills carousel
- `SkillCard` - Skill card with teacher info

### 2. Wallet Screen (`wallet_screen.dart`)
**Location:** `lib/features/time_bank/presentation/screens/wallet_screen.dart`

**Features:**
- ✅ Large gradient balance card with animation
- ✅ Buy hours button
- ✅ Recent transactions list
- ✅ Transaction type indicators:
  - 🟢 Earned (green) - from teaching sessions
  - 🔴 Spent (red) - from learning sessions
  - 🔵 Purchased (blue) - bought hours
  - 🟡 Welcome (amber) - welcome bonus

**Navigation:**
- Tap buy hours → `/buy-hours` (placeholder)
- Tap transactions → `/transactions` (placeholder)

**Widgets Used:**
- `BalanceCard` - Gradient balance card with animation
- `TransactionTile` - Transaction list item

### 3. Settings Screen (`settings_screen.dart`)
**Location:** `lib/features/settings/presentation/screens/settings_screen.dart`

**Features:**
- ✅ Notifications toggle (functional UI)
- ✅ Dark mode toggle (UI only)
- ✅ Language selector (Arabic only note)
- ✅ About screen navigation
- ✅ Contact us (email intent)
- ✅ Rate app
- ✅ Share app
- ✅ Delete account with confirmation dialog
- ✅ App version display

**Navigation:**
- Tap about → `/about`

**Widgets Used:**
- `SettingsTile` - Reusable settings item

### 4. About Screen (`about_screen.dart`)
**Location:** `lib/features/settings/presentation/screens/about_screen.dart`

**Features:**
- ✅ App icon with gradient
- ✅ App name and slogan
- ✅ Description in Arabic
- ✅ Features list with emojis
- ✅ Version and copyright info

### 5. Notifications Screen (`notifications_screen.dart`)
**Location:** `lib/features/notifications/presentation/screens/notifications_screen.dart`

**Features:**
- ✅ Notification types:
  - 📅 Booking requests
  - ✅ Booking accepted
  - ⏰ Session reminders
  - ⭐ New reviews
  - 💰 Hours added
- ✅ Unread indicator (blue dot)
- ✅ Mark all as read button
- ✅ Empty state when no notifications
- ✅ Color-coded icons per type

**Widgets Used:**
- `NotificationTile` - Individual notification item

## 🧩 Shared Widgets

### 1. `AvatarWidget`
**Location:** `lib/shared/widgets/avatar_widget.dart`

**Features:**
- Three sizes: small (18px), medium (24px), large (50px)
- Shows initials when no image
- Online indicator support
- CachedNetworkImage integration

**Usage:**
```dart
AvatarWidget(
  imageUrl: 'https://...',
  name: 'أحمد محمد',
  size: AvatarSize.medium,
  showOnlineIndicator: true,
  isOnline: true,
)
```

### 2. `RatingBar`
**Location:** `lib/shared/widgets/rating_bar.dart`

**Features:**
- Star rating display (read-only)
- Star rating input (interactive)
- Half-star support
- Customizable colors and size

**Usage:**
```dart
// Display mode
RatingBar(
  rating: 4.5,
  size: 20,
)

// Interactive mode
RatingBar(
  rating: 0,
  isInteractive: true,
  onRatingChanged: (rating) {
    print('New rating: $rating');
  },
)
```

### 3. `EmptyState`
**Location:** `lib/shared/widgets/empty_state.dart`

**Features:**
- Icon or image support
- Title and description
- Optional action button

**Usage:**
```dart
EmptyState(
  icon: Icons.inbox_rounded,
  title: 'لا توجد بيانات',
  description: 'سيتم عرض البيانات هنا عند توفرها',
  actionLabel: 'تحديث',
  onActionPressed: () {},
)
```

### 4. `ShimmerLoading`
**Location:** `lib/shared/widgets/shimmer_loading.dart`

**Features:**
- Shimmer loading effect
- Pre-built placeholders:
  - `SkillCardShimmer`
  - `ProfileShimmer`
  - `ListItemShimmer`

**Usage:**
```dart
// Custom shimmer
ShimmerLoading(
  width: 100,
  height: 20,
  borderRadius: 8,
)

// Pre-built
SkillCardShimmer()
```

### 5. `CustomAppBar`
**Location:** `lib/shared/widgets/custom_app_bar.dart`

**Usage:**
```dart
CustomAppBar(
  title: 'الإعدادات',
  showBackButton: true,
  actions: [
    IconButton(
      icon: Icon(Icons.info),
      onPressed: () {},
    ),
  ],
)
```

### 6. `ConfirmDialog`
**Location:** `lib/shared/widgets/confirm_dialog.dart`

**Usage:**
```dart
final confirmed = await ConfirmDialog.show(
  context: context,
  title: 'تسجيل الخروج',
  message: 'هل أنت متأكد؟',
  isDanger: true,
  confirmText: 'نعم',
  cancelText: 'لا',
);

if (confirmed == true) {
  // User confirmed
}
```

### 7. `BottomSheetHandle`
**Location:** `lib/shared/widgets/bottom_sheet_handle.dart`

**Usage:**
```dart
showModalBottomSheet(
  context: context,
  builder: (context) => Column(
    children: [
      BottomSheetHandle(),
      // Content
    ],
  ),
)
```

## 🎨 UI Design System

### Colors (`app_colors.dart`)
- Primary: Indigo (#6366F1)
- Secondary: Teal (#14B8A6)
- Accent: Amber (#F59E0B)
- Success: Green (#10B981)
- Error: Red (#EF4444)
- Warning: Amber (#F59E0B)
- Info: Blue (#3B82F6)

### Categories
All 10 categories with unique colors and Iconsax icons:
1. 💻 برمجة وتطوير - Indigo
2. 🎨 تصميم وإبداع - Pink
3. 🌐 لغات - Teal
4. 📊 أعمال وتسويق - Amber
5. 🎵 موسيقى وفنون - Purple
6. ⚽ رياضة ولياقة - Red
7. 📚 تعليم أكاديمي - Blue
8. 🌟 تطوير ذاتي - Green
9. 📷 تصوير وفيديو - Orange
10. ⚙️ أخرى - Gray

### Animations
- Fade in: 300ms
- Scale: 200ms delay
- Slide: 300ms with 0.2 offset
- Balance card: 500ms fade + 200ms scale

### Spacing
- Padding: 12px, 16px, 24px
- Gap: 8px, 12px, 16px, 24px, 32px
- Border radius: 8px, 12px, 14px, 16px, 20px, 24px

## 🚀 Running the App

### Prerequisites
```bash
flutter --version  # Should be >= 3.16.0
```

### Installation
```bash
# Get dependencies
flutter pub get

# Run the app
flutter run
```

### Key Packages
- `flutter_bloc` - State management
- `go_router` - Navigation
- `iconsax` - Icons
- `flutter_animate` - Animations
- `shimmer` - Loading states
- `cached_network_image` - Image caching
- `equatable` - Value equality
- `url_launcher` - External URLs

## 🔄 Navigation Flow

### From Home Screen
```
Home → Notifications Screen
Home → Wallet Screen
Home → Skill Detail Screen
Home → Category Skills Screen (placeholder)
Home → Search Screen (placeholder)
```

### From Profile Tab
```
Profile → Settings Screen
Settings → About Screen
Profile → Edit Profile (placeholder)
Profile → My Skills (placeholder)
```

### From Wallet Screen
```
Wallet → Buy Hours Screen (placeholder)
Wallet → Transactions Screen (placeholder)
```

## 📊 State Management

Currently using dummy data. For full implementation, each feature needs:

1. **Domain Layer**
   - Entities (e.g., `Skill`, `Booking`, `Profile`)
   - Repository interfaces

2. **Data Layer**
   - Models (extends entities)
   - Repository implementations
   - Supabase integration

3. **Presentation Layer**
   - BLoC (Events, States, BLoC)
   - Screens
   - Widgets

## 🎯 Next Steps

### Immediate (to make app fully functional)
1. Implement Skills BLoC and data layer
2. Implement Profile BLoC and data layer
3. Create add/edit skill screens
4. Create search functionality
5. Integrate with Supabase for real data

### Short-term
1. Implement Booking system
2. Expand Chat feature with real-time messaging
3. Implement Reviews system
4. Complete Time Bank payment flow

### Long-term
1. Add video call integration
2. Implement push notifications
3. Add analytics
4. Performance optimization
5. Accessibility improvements

## 📁 File Structure

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_categories.dart (NEW)
│   │   └── app_strings.dart (UPDATED)
│   ├── models/
│   │   └── category.dart (NEW)
│   └── router/
│       └── app_router.dart (UPDATED)
│
├── features/
│   ├── home/ (NEW)
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── home_screen.dart
│   │       └── widgets/
│   │           ├── home_header.dart
│   │           ├── search_bar_widget.dart
│   │           ├── categories_section.dart
│   │           ├── category_card.dart
│   │           ├── featured_skills_section.dart
│   │           └── skill_card.dart
│   │
│   ├── settings/ (NEW)
│   │   └── presentation/
│   │       ├── screens/
│   │       │   ├── settings_screen.dart
│   │       │   └── about_screen.dart
│   │       └── widgets/
│   │           └── settings_tile.dart
│   │
│   ├── notifications/ (NEW)
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── notifications_screen.dart
│   │       └── widgets/
│   │           └── notification_tile.dart
│   │
│   ├── time_bank/ (NEW)
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── wallet_screen.dart
│   │       └── widgets/
│   │           ├── balance_card.dart
│   │           └── transaction_tile.dart
│   │
│   └── main/
│       └── presentation/
│           └── screens/
│               └── main_screen.dart (UPDATED)
│
└── shared/
    └── widgets/ (NEW)
        ├── avatar_widget.dart
        ├── rating_bar.dart
        ├── empty_state.dart
        ├── shimmer_loading.dart
        ├── custom_app_bar.dart
        ├── confirm_dialog.dart
        └── bottom_sheet_handle.dart
```

## 🐛 Known Issues

1. Flutter/Dart not available in CI environment for compilation check
2. Some placeholder routes show empty Placeholder widget
3. Dark mode toggle is UI only (not functional)
4. All data is currently dummy/mock data

## ✅ Checklist

- [x] Home screen with categories and skills
- [x] Settings and About screens
- [x] Notifications screen
- [x] Wallet screen
- [x] Shared reusable widgets
- [x] Bottom navigation with Iconsax icons
- [x] RTL support
- [x] Arabic strings
- [x] Animations
- [x] Empty states
- [x] Loading states (shimmer)
- [ ] Skills full implementation (needs BLoC)
- [ ] Profile full implementation (needs BLoC)
- [ ] Booking system (needs BLoC)
- [ ] Chat expansion (needs Supabase)
- [ ] Reviews system (needs implementation)

## 📝 Notes

- This implementation focuses on UI/UX and navigation structure
- All screens are designed with RTL layout in mind
- Cairo font is used throughout (via Google Fonts)
- Animations use flutter_animate package
- All colors follow the defined color scheme
- Code follows Clean Architecture principles where implemented
- BLoC pattern is ready to be added for state management

## 🤝 Contributing

When adding new features:
1. Follow the existing file structure
2. Use AppStrings for all text
3. Use AppColors for all colors
4. Use Iconsax for all icons
5. Implement Clean Architecture (Domain → Data → Presentation)
6. Add animations with flutter_animate
7. Handle empty and loading states
8. Support RTL layout

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [BLoC Pattern](https://bloclibrary.dev/)
- [Go Router](https://pub.dev/packages/go_router)
- [Iconsax](https://pub.dev/packages/iconsax)
- [Flutter Animate](https://pub.dev/packages/flutter_animate)
