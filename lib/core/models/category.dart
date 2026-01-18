import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String nameAr;
  final String nameEn;
  final IconData icon;
  final Color color;

  const Category({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.icon,
    required this.color,
  });

  @override
  List<Object?> get props => [id, nameAr, nameEn, icon, color];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      nameAr: json['name_ar'] as String,
      nameEn: json['name_en'] as String,
      icon: Icons.category, // Default, will be mapped in constants
      color: const Color(0xFF6366F1), // Default
    );
  }
}
