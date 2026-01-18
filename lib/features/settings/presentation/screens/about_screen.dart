import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/custom_app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.about,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // App icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.handshake_rounded,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 24),

            // App name
            Text(
              AppStrings.appName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 8),

            // App slogan
            Text(
              AppStrings.appSlogan,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Description
            Text(
              'مهارات هو تطبيق تبادل المهارات القائم على نظام بنك الوقت. '
              'يمكنك تعليم الآخرين ما تتقنه وكسب ساعات، ثم استخدام هذه الساعات '
              'لتعلم مهارات جديدة من الآخرين.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.8,
                  ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Features
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'المميزات',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    _buildFeature(
                      context,
                      '⏰',
                      'نظام بنك الوقت',
                      'ساعة تعليم = ساعة تعلّم',
                    ),
                    _buildFeature(
                      context,
                      '🤝',
                      'تبادل عادل',
                      'جميع المهارات لها نفس القيمة',
                    ),
                    _buildFeature(
                      context,
                      '🎓',
                      'تعلم من الخبراء',
                      'تواصل مع معلمين متميزين',
                    ),
                    _buildFeature(
                      context,
                      '💼',
                      'طور مهاراتك',
                      'تعلم مهارات جديدة ومفيدة',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Version
            Text(
              '${AppStrings.version} 1.0.0',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiary,
                  ),
            ),

            const SizedBox(height: 8),

            // Copyright
            Text(
              '© 2024 مهارات. جميع الحقوق محفوظة.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiary,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(
    BuildContext context,
    String emoji,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
