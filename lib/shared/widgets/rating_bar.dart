import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class RatingBar extends StatefulWidget {
  final double rating;
  final int maxRating;
  final double size;
  final bool isInteractive;
  final ValueChanged<double>? onRatingChanged;
  final Color activeColor;
  final Color inactiveColor;

  const RatingBar({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 20,
    this.isInteractive = false,
    this.onRatingChanged,
    this.activeColor = AppColors.accent,
    this.inactiveColor = AppColors.dividerLight,
  });

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  void didUpdateWidget(RatingBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rating != widget.rating) {
      _currentRating = widget.rating;
    }
  }

  void _handleTap(int index) {
    if (!widget.isInteractive) return;

    setState(() {
      _currentRating = (index + 1).toDouble();
    });

    widget.onRatingChanged?.call(_currentRating);
  }

  Widget _buildStar(int index) {
    IconData iconData;
    Color color;

    if (index < _currentRating.floor()) {
      // Full star
      iconData = Icons.star_rounded;
      color = widget.activeColor;
    } else if (index < _currentRating.ceil() && _currentRating % 1 != 0) {
      // Half star
      iconData = Icons.star_half_rounded;
      color = widget.activeColor;
    } else {
      // Empty star
      iconData = Icons.star_border_rounded;
      color = widget.inactiveColor;
    }

    return GestureDetector(
      onTap: widget.isInteractive ? () => _handleTap(index) : null,
      child: Icon(
        iconData,
        size: widget.size,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.maxRating,
        (index) => _buildStar(index),
      ),
    );
  }
}
