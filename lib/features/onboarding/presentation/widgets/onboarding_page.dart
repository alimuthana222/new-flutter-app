import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          
          // Icon
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 100,
              color: color,
            ),
          ),

          const SizedBox(height: 48),

          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 16),

          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
