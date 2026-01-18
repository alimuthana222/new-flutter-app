import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/otp_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/main/presentation/screens/main_screen.dart';
import '../../features/skills/presentation/screens/skill_detail_screen.dart';
import '../../features/chat/presentation/screens/chat_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/settings/presentation/screens/about_screen.dart';
import '../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../features/time_bank/presentation/screens/wallet_screen.dart';

class AppRouter {
  // Route names
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String forgotPassword = '/forgot-password';
  static const String main = '/main';
  static const String search = '/search';
  static const String notifications = '/notifications';
  static const String wallet = '/wallet';
  static const String skillDetail = '/skill/:id';
  static const String addSkill = '/add-skill';
  static const String categorySkills = '/category/:id';
  static const String chat = '/chat/:id';
  
  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: otp,
        builder: (context, state) {
          final email = state.extra as String? ?? '';
          return OtpScreen(email: email);
        },
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/skill/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return SkillDetailScreen(skillId: id);
        },
      ),
      GoRoute(
        path: '/chat/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ChatScreen(chatId: id);
        },
      ),
      // Settings and About
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => const AboutScreen(),
      ),
      // Placeholder routes - will be implemented later
      GoRoute(
        path: search,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: wallet,
        builder: (context, state) => const WalletScreen(),
      ),
      GoRoute(
        path: addSkill,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/category/:id',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/transactions',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/buy-hours',
        builder: (context, state) => const Placeholder(),
      ),
    ],
  );
}
