import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/category.dart';

class AppCategories {
  static final List<Category> all = [
    const Category(
      id: '1',
      nameAr: 'برمجة وتطوير',
      nameEn: 'Programming',
      icon: Iconsax.code,
      color: Color(0xFF6366F1),
    ),
    const Category(
      id: '2',
      nameAr: 'تصميم وإبداع',
      nameEn: 'Design',
      icon: Iconsax.brush,
      color: Color(0xFFEC4899),
    ),
    const Category(
      id: '3',
      nameAr: 'لغات',
      nameEn: 'Languages',
      icon: Iconsax.translate,
      color: Color(0xFF14B8A6),
    ),
    const Category(
      id: '4',
      nameAr: 'أعمال وتسويق',
      nameEn: 'Business',
      icon: Iconsax.chart,
      color: Color(0xFFF59E0B),
    ),
    const Category(
      id: '5',
      nameAr: 'موسيقى وفنون',
      nameEn: 'Music',
      icon: Iconsax.music,
      color: Color(0xFF8B5CF6),
    ),
    const Category(
      id: '6',
      nameAr: 'رياضة ولياقة',
      nameEn: 'Sports',
      icon: Iconsax.weight,
      color: Color(0xFFEF4444),
    ),
    const Category(
      id: '7',
      nameAr: 'تعليم أكاديمي',
      nameEn: 'Academic',
      icon: Iconsax.teacher,
      color: Color(0xFF3B82F6),
    ),
    const Category(
      id: '8',
      nameAr: 'تطوير ذاتي',
      nameEn: 'Personal',
      icon: Iconsax.user_octagon,
      color: Color(0xFF10B981),
    ),
    const Category(
      id: '9',
      nameAr: 'تصوير وفيديو',
      nameEn: 'Photography',
      icon: Iconsax.camera,
      color: Color(0xFFF97316),
    ),
    const Category(
      id: '10',
      nameAr: 'أخرى',
      nameEn: 'Other',
      icon: Iconsax.more,
      color: Color(0xFF6B7280),
    ),
  ];

  static Category? getById(String id) {
    try {
      return all.firstWhere((cat) => cat.id == id);
    } catch (e) {
      return null;
    }
  }

  static Category? getByName(String name) {
    try {
      return all.firstWhere(
        (cat) => cat.nameAr == name || cat.nameEn == name,
      );
    } catch (e) {
      return null;
    }
  }
}
