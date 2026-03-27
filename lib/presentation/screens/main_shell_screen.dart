import 'package:flutter/material.dart';
import 'package:wasl_iman/presentation/screens/home_screen.dart';
import 'package:wasl_iman/presentation/screens/prayer_times_screen.dart';
import 'package:wasl_iman/presentation/screens/settings_screen.dart';
import 'package:wasl_iman/presentation/screens/tasbeeh_screen.dart';
import 'package:wasl_iman/presentation/screens/worship_tracker_screen.dart';
import 'package:wasl_iman/presentation/widgets/app_bottom_nav.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int _index = 0;

  final _screens = const [
    HomeScreen(),
    PrayerTimesScreen(),
    TasbeehScreen(),
    WorshipTrackerScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: AppBottomNav(currentIndex: _index, onTap: (value) => setState(() => _index = value)),
    );
  }
}
