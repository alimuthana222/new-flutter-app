import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/custom_app_bar.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../widgets/notification_tile.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Dummy notifications data
  final List<Map<String, dynamic>> _notifications = [
    {
      'id': '1',
      'type': 'booking_request',
      'title': 'طلب جلسة جديد',
      'message': 'طلب جلسة جديد من أحمد محمد لتعلم Flutter',
      'time': 'منذ 5 دقائق',
      'isRead': false,
      'icon': Iconsax.calendar,
      'color': AppColors.primary,
    },
    {
      'id': '2',
      'type': 'booking_accepted',
      'title': 'تم قبول طلبك',
      'message': 'تم قبول طلب جلستك مع سارة أحمد',
      'time': 'منذ ساعة',
      'isRead': false,
      'icon': Iconsax.tick_circle,
      'color': AppColors.success,
    },
    {
      'id': '3',
      'type': 'session_reminder',
      'title': 'تذكير بالجلسة',
      'message': 'جلستك مع محمد علي بعد 15 دقيقة',
      'time': 'منذ ساعتين',
      'isRead': true,
      'icon': Iconsax.clock,
      'color': AppColors.warning,
    },
    {
      'id': '4',
      'type': 'new_review',
      'title': 'تقييم جديد',
      'message': 'تلقيت تقييماً جديداً من فاطمة أحمد',
      'time': 'أمس',
      'isRead': true,
      'icon': Iconsax.star,
      'color': AppColors.accent,
    },
    {
      'id': '5',
      'type': 'hours_added',
      'title': 'تمت إضافة ساعات',
      'message': 'تمت إضافة 3 ساعات لرصيدك',
      'time': 'أمس',
      'isRead': true,
      'icon': Iconsax.wallet_add,
      'color': AppColors.info,
    },
  ];

  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification['isRead'] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasNotifications = _notifications.isNotEmpty;
    final hasUnread =
        _notifications.any((n) => n['isRead'] == false);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.notifications,
        showBackButton: true,
        actions: hasUnread
            ? [
                TextButton(
                  onPressed: _markAllAsRead,
                  child: Text(AppStrings.markAllAsRead),
                ),
              ]
            : null,
      ),
      body: hasNotifications
          ? ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return NotificationTile(
                  icon: notification['icon'] as IconData,
                  title: notification['title'] as String,
                  message: notification['message'] as String,
                  time: notification['time'] as String,
                  isRead: notification['isRead'] as bool,
                  iconColor: notification['color'] as Color,
                  onTap: () {
                    setState(() {
                      notification['isRead'] = true;
                    });
                    // Navigate to related screen based on type
                  },
                );
              },
            )
          : EmptyState(
              icon: Iconsax.notification,
              title: AppStrings.noNotifications,
              description: 'ستظهر الإشعارات هنا عند وجودها',
            ),
    );
  }
}
