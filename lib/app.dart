import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wasl_iman/core/router/app_router.dart';
import 'package:wasl_iman/core/theme/app_theme.dart';
import 'package:wasl_iman/localization/app_localizations.dart';
import 'package:wasl_iman/presentation/providers/adhkar_provider.dart';
import 'package:wasl_iman/presentation/providers/app_settings_provider.dart';
import 'package:wasl_iman/presentation/providers/prayer_times_provider.dart';
import 'package:wasl_iman/presentation/providers/tasbeeh_provider.dart';
import 'package:wasl_iman/presentation/providers/wird_provider.dart';
import 'package:wasl_iman/presentation/providers/worship_tracker_provider.dart';

class WaslImanApp extends StatelessWidget {
  const WaslImanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppSettingsProvider()..loadSettings()),
        ChangeNotifierProvider(create: (_) => AdhkarProvider()..load()),
        ChangeNotifierProvider(create: (_) => PrayerTimesProvider()..load()),
        ChangeNotifierProvider(create: (_) => TasbeehProvider()..load()),
        ChangeNotifierProvider(create: (_) => WirdProvider()..load()),
        ChangeNotifierProvider(create: (_) => WorshipTrackerProvider()..load()),
      ],
      child: Consumer<AppSettingsProvider>(
        builder: (context, settings, _) {
          return MaterialApp(
            title: 'وصل إيمان',
            debugShowCheckedModeBanner: false,
            locale: settings.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: settings.themeMode,
            initialRoute: AppRouter.splash,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
