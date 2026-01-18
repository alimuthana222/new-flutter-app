import 'package:intl/intl.dart' as intl;

class Helpers {
  // Format date to Arabic
  static String formatDate(DateTime date) {
    return intl.DateFormat('yyyy/MM/dd', 'ar').format(date);
  }

  // Format time to Arabic
  static String formatTime(DateTime time) {
    return intl.DateFormat('HH:mm', 'ar').format(time);
  }

  // Format date and time to Arabic
  static String formatDateTime(DateTime dateTime) {
    return intl.DateFormat('yyyy/MM/dd HH:mm', 'ar').format(dateTime);
  }

  // Format relative time (e.g., "منذ ساعة")
  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'منذ لحظات';
    } else if (difference.inMinutes < 60) {
      return 'منذ ${difference.inMinutes} دقيقة';
    } else if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    } else if (difference.inDays < 7) {
      return 'منذ ${difference.inDays} يوم';
    } else if (difference.inDays < 30) {
      return 'منذ ${(difference.inDays / 7).floor()} أسبوع';
    } else if (difference.inDays < 365) {
      return 'منذ ${(difference.inDays / 30).floor()} شهر';
    } else {
      return 'منذ ${(difference.inDays / 365).floor()} سنة';
    }
  }

  // Show snackbar helper
  static void showSnackBar(
    dynamic context,
    String message, {
    bool isError = false,
  }) {
    // This will be implemented in the app context
    // Using ScaffoldMessenger
  }

  // Validate Iraqi phone number
  static bool isValidIraqiPhone(String phone) {
    final phoneRegex = RegExp(r'^07[3-9]\d{8}$');
    return phoneRegex.hasMatch(phone);
  }

  // Hide keyboard
  static void hideKeyboard(dynamic context) {
    // FocusScope.of(context).unfocus();
  }
}
