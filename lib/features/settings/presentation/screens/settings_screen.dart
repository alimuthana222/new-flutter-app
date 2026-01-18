import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/custom_app_bar.dart';
import '../../../../shared/widgets/confirm_dialog.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.settings,
        showBackButton: true,
      ),
      body: ListView(
        children: [
          // Notifications toggle
          SettingsTile(
            icon: Iconsax.notification,
            title: AppStrings.notificationsSettings,
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() => _notificationsEnabled = value);
              },
            ),
            onTap: null,
          ),

          // Dark mode toggle
          SettingsTile(
            icon: Iconsax.moon,
            title: AppStrings.darkMode,
            trailing: Switch(
              value: _darkModeEnabled,
              onChanged: (value) {
                setState(() => _darkModeEnabled = value);
              // TODO(feature): Implement dark mode theme switching - #issue-number
              },
            ),
            onTap: null,
          ),

          // Language
          SettingsTile(
            icon: Iconsax.language_square,
            title: AppStrings.language,
            subtitle: AppStrings.arabicOnly,
            onTap: () {
              // TODO: Language selection
            },
          ),

          const Divider(height: 32),

          // About
          SettingsTile(
            icon: Iconsax.info_circle,
            title: AppStrings.about,
            onTap: () => context.push('/about'),
          ),

          // Contact us
          SettingsTile(
            icon: Iconsax.message_question,
            title: AppStrings.contactUs,
            onTap: () async {
              final Uri emailUri = Uri(
                scheme: 'mailto',
                path: 'support@maharat.app',
                queryParameters: {
                  'subject': 'استفسار من تطبيق مهارات',
                },
              );
              if (await canLaunchUrl(emailUri)) {
                await launchUrl(emailUri);
              }
            },
          ),

          // Rate app
          SettingsTile(
            icon: Iconsax.star,
            title: AppStrings.rateApp,
            onTap: () {
              // TODO: Open app store
            },
          ),

          // Share app
          SettingsTile(
            icon: Iconsax.share,
            title: AppStrings.shareApp,
            onTap: () {
              // TODO: Share app
            },
          ),

          const Divider(height: 32),

          // Delete account
          SettingsTile(
            icon: Iconsax.trash,
            title: AppStrings.deleteAccount,
            isDanger: true,
            onTap: () async {
              final confirmed = await ConfirmDialog.show(
                context: context,
                title: AppStrings.deleteAccount,
                message: AppStrings.deleteAccountConfirm,
                isDanger: true,
                confirmText: AppStrings.delete,
              );

              if (confirmed == true) {
                // TODO: Delete account logic
              }
            },
          ),

          const SizedBox(height: 16),

          // App version
          Center(
            child: Text(
              '${AppStrings.version} 1.0.0',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiary,
                  ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
