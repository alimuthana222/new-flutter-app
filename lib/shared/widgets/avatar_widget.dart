import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/constants/app_colors.dart';

enum AvatarSize { small, medium, large }

class AvatarWidget extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final AvatarSize size;
  final bool showOnlineIndicator;
  final bool isOnline;

  const AvatarWidget({
    super.key,
    this.imageUrl,
    this.name,
    this.size = AvatarSize.medium,
    this.showOnlineIndicator = false,
    this.isOnline = false,
  });

  double get _radius {
    switch (size) {
      case AvatarSize.small:
        return 18;
      case AvatarSize.medium:
        return 24;
      case AvatarSize.large:
        return 50;
    }
  }

  double get _indicatorSize {
    switch (size) {
      case AvatarSize.small:
        return 8;
      case AvatarSize.medium:
        return 10;
      case AvatarSize.large:
        return 14;
    }
  }

  String get _initials {
    if (name == null || name!.isEmpty) return '؟';
    final parts = name!.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}';
    }
    return name![0];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: _radius,
          backgroundColor: AppColors.primaryContainer,
          backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
              ? CachedNetworkImageProvider(imageUrl!)
              : null,
          child: imageUrl == null || imageUrl!.isEmpty
              ? Text(
                  _initials,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: _radius * 0.6,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
        ),
        if (showOnlineIndicator)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: _indicatorSize,
              height: _indicatorSize,
              decoration: BoxDecoration(
                color: isOnline ? AppColors.success : AppColors.textTertiary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
