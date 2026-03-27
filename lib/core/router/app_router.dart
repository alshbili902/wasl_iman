import 'package:flutter/material.dart';
import 'package:wasl_iman/presentation/screens/about_screen.dart';
import 'package:wasl_iman/presentation/screens/daily_wird_screen.dart';
import 'package:wasl_iman/presentation/screens/evening_adhkar_screen.dart';
import 'package:wasl_iman/presentation/screens/main_shell_screen.dart';
import 'package:wasl_iman/presentation/screens/morning_adhkar_screen.dart';
import 'package:wasl_iman/presentation/screens/onboarding_screen.dart';
import 'package:wasl_iman/presentation/screens/prayer_times_screen.dart';
import 'package:wasl_iman/presentation/screens/settings_screen.dart';
import 'package:wasl_iman/presentation/screens/splash_screen.dart';
import 'package:wasl_iman/presentation/screens/tasbeeh_screen.dart';
import 'package:wasl_iman/presentation/screens/worship_tracker_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String shell = '/shell';
  static const String morningAdhkar = '/adhkar/morning';
  static const String eveningAdhkar = '/adhkar/evening';
  static const String prayerTimes = '/prayer-times';
  static const String tasbeeh = '/tasbeeh';
  static const String dailyWird = '/daily-wird';
  static const String worshipTracker = '/worship-tracker';
  static const String settings = '/settings';
  static const String about = '/about';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _materialRoute(const SplashScreen());
      case onboarding:
        return _materialRoute(const OnboardingScreen());
      case shell:
        return _materialRoute(const MainShellScreen());
      case morningAdhkar:
        return _materialRoute(const MorningAdhkarScreen());
      case eveningAdhkar:
        return _materialRoute(const EveningAdhkarScreen());
      case prayerTimes:
        return _materialRoute(const PrayerTimesScreen());
      case tasbeeh:
        return _materialRoute(const TasbeehScreen());
      case dailyWird:
        return _materialRoute(const DailyWirdScreen());
      case worshipTracker:
        return _materialRoute(const WorshipTrackerScreen());
      case settings:
        return _materialRoute(const SettingsScreen());
      case about:
        return _materialRoute(const AboutScreen());
      default:
        return _materialRoute(const SplashScreen());
    }
  }

  static MaterialPageRoute<dynamic> _materialRoute(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
