import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/avatar_widget.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final String? userAvatar;
  final VoidCallback onNotificationTap;

  const HomeHeader({
    super.key,
    required this.userName,
    this.userAvatar,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Avatar
          GestureDetector(
            onTap: () => context.push('/profile'),
            child: AvatarWidget(
              imageUrl: userAvatar,
              name: userName,
              size: AvatarSize.medium,
            ),
          ),

          const SizedBox(width: 12),

          // Greeting
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.greeting,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
                Text(
                  userName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Notification button
          IconButton(
            icon: const Icon(Iconsax.notification),
            onPressed: onNotificationTap,
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primaryContainer,
              foregroundColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
