import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    // Check if first time opening the app
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('first_time') ?? true;
    final isLoggedIn = prefs.getBool('is_logged_in') ?? false;

    if (isFirstTime) {
      await prefs.setBool('first_time', false);
      if (mounted) {
        context.go(AppRouter.onboarding);
      }
    } else if (isLoggedIn) {
      // Navigate to main screen (not implemented yet)
      if (mounted) {
        context.go(AppRouter.login);
      }
    } else {
      if (mounted) {
        context.go(AppRouter.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.lightbulb_outline,
                  size: 60,
                  color: AppColors.primary,
                ),
              )
                  .animate()
                  .scale(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOutBack,
                  )
                  .then()
                  .shimmer(
                    duration: const Duration(milliseconds: 800),
                    color: Colors.white.withOpacity(0.3),
                  ),

              const SizedBox(height: 32),

              // App Name
              Text(
                AppStrings.appName,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              )
                  .animate()
                  .fadeIn(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 300),
                  )
                  .slideY(
                    begin: 0.3,
                    end: 0,
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 300),
                  ),

              const SizedBox(height: 8),

              // Slogan
              Text(
                AppStrings.appSlogan,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
              )
                  .animate()
                  .fadeIn(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 600),
                  )
                  .slideY(
                    begin: 0.3,
                    end: 0,
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 600),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
