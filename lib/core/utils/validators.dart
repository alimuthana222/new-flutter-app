import '../constants/app_strings.dart';

class Validators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emailRequired;
    }
    
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    
    if (!emailRegex.hasMatch(value)) {
      return AppStrings.emailInvalid;
    }
    
    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }
    
    if (value.length < 8) {
      return AppStrings.passwordTooShort;
    }
    
    return null;
  }

  // Confirm password validation
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }
    
    if (value != password) {
      return AppStrings.passwordsNotMatch;
    }
    
    return null;
  }

  // Name validation
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.nameRequired;
    }
    
    if (value.length < 2) {
      return AppStrings.nameRequired;
    }
    
    return null;
  }

  // Phone validation (Iraqi format: 07xxxxxxxxx)
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.phoneRequired;
    }
    
    final phoneRegex = RegExp(r'^07[3-9]\d{8}$');
    
    if (!phoneRegex.hasMatch(value)) {
      return AppStrings.phoneInvalid;
    }
    
    return null;
  }

  // Required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName مطلوب';
    }
    
    return null;
  }
}
