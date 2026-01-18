import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_strings.dart';
import 'skill_card.dart';

class FeaturedSkillsSection extends StatelessWidget {
  const FeaturedSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for now
    final skills = List.generate(5, (index) => {
      'id': '${index + 1}',
      'title': 'تطوير تطبيقات Flutter',
      'teacher': 'أحمد محمد',
      'rating': 4.5,
      'category': 'برمجة وتطوير',
      'price': index % 2 == 0 ? null : 15000,
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.featuredSkills,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to all skills
                },
                child: const Text(AppStrings.seeAll),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              final skill = skills[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: 200,
                  child: SkillCard(
                    skillId: skill['id'] as String,
                    title: skill['title'] as String,
                    teacherName: skill['teacher'] as String,
                    rating: skill['rating'] as double,
                    category: skill['category'] as String,
                    price: skill['price'] as int?,
                    onTap: () => context.push('/skill/${skill['id']}'),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
