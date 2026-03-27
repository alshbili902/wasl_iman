import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasl_iman/core/constants/context_x.dart';
import 'package:wasl_iman/core/router/app_router.dart';
import 'package:wasl_iman/presentation/providers/app_settings_provider.dart';
import 'package:wasl_iman/presentation/widgets/gradient_scaffold.dart';
import 'package:wasl_iman/presentation/widgets/setting_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettingsProvider>();

    return GradientScaffold(
      appBar: AppBar(title: Text(context.l10n.t('settings'))),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SettingTile(
            title: context.l10n.t('language'),
            subtitle: 'العربية / English',
            icon: Icons.language_rounded,
            trailing: DropdownButton<String>(
              value: settings.locale.languageCode,
              underline: const SizedBox.shrink(),
              items: const [
                DropdownMenuItem(value: 'ar', child: Text('العربية')),
                DropdownMenuItem(value: 'en', child: Text('English')),
              ],
              onChanged: (value) {
                if (value != null) settings.setLanguage(value);
              },
            ),
          ),
          const SizedBox(height: 10),
          SettingTile(
            title: context.l10n.t('theme'),
            subtitle: 'Light / Dark placeholder',
            icon: Icons.palette_rounded,
            trailing: Switch(
              value: settings.themeMode == ThemeMode.dark,
              onChanged: settings.toggleTheme,
            ),
          ),
          const SizedBox(height: 10),
          SettingTile(
            title: context.l10n.t('notifications'),
            subtitle: 'Reminder toggle placeholder',
            icon: Icons.notifications_active_rounded,
            trailing: Switch(
              value: settings.notificationsEnabled,
              onChanged: settings.toggleNotifications,
            ),
          ),
          const SizedBox(height: 10),
          SettingTile(
            title: context.l10n.t('about'),
            subtitle: 'وصل إيمان',
            icon: Icons.info_outline_rounded,
            onTap: () => Navigator.pushNamed(context, AppRouter.about),
          ),
          const SizedBox(height: 16),
          Text(context.l10n.t('privacy_note'), style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
