import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';

class SkillDetailScreen extends StatelessWidget {
  final String skillId;

  const SkillDetailScreen({
    super.key,
    required this.skillId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('تفاصيل المهارة'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Skill Image
            Container(
              width: double.infinity,
              height: 250,
              color: AppColors.primaryContainer,
              child: const Icon(
                Icons.code,
                size: 100,
                color: AppColors.primary,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Skill Title
                  Text(
                    'مهارة $skillId',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Rating
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.accent,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '4.5',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(23 تقييم)',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Description
                  Text(
                    'الوصف',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'هذه مهارة تجريبية لأغراض العرض. سيتم إضافة الوصف الحقيقي لاحقاً.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Teacher Info
                  Text(
                    'المعلم',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(
                      backgroundColor: AppColors.primaryContainer,
                      child: Icon(Icons.person, color: AppColors.primary),
                    ),
                    title: const Text('اسم المعلم'),
                    subtitle: const Text('متخصص في البرمجة'),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Book Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('حجز جلسة'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
