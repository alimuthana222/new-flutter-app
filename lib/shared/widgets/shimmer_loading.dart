import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/constants/app_colors.dart';

class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerLoading({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.dividerLight,
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class SkillCardShimmer extends StatelessWidget {
  const SkillCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerLoading(width: double.infinity, height: 80, borderRadius: 12),
            const SizedBox(height: 12),
            const ShimmerLoading(width: double.infinity, height: 16, borderRadius: 4),
            const SizedBox(height: 8),
            const ShimmerLoading(width: 100, height: 12, borderRadius: 4),
            const Spacer(),
            Row(
              children: [
                const ShimmerLoading(width: 60, height: 12, borderRadius: 4),
                const Spacer(),
                const ShimmerLoading(width: 40, height: 12, borderRadius: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const ShimmerLoading(width: 100, height: 100, borderRadius: 50),
        const SizedBox(height: 16),
        const ShimmerLoading(width: 150, height: 20, borderRadius: 4),
        const SizedBox(height: 8),
        const ShimmerLoading(width: 100, height: 14, borderRadius: 4),
        const SizedBox(height: 32),
        ...List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const ShimmerLoading(width: double.infinity, height: 56, borderRadius: 8),
          ),
        ),
      ],
    );
  }
}

class ListItemShimmer extends StatelessWidget {
  const ListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const ShimmerLoading(width: 50, height: 50, borderRadius: 25),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShimmerLoading(width: double.infinity, height: 16, borderRadius: 4),
                const SizedBox(height: 8),
                const ShimmerLoading(width: 150, height: 12, borderRadius: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
