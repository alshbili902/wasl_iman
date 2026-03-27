import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 72,
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.access_time_filled_rounded), label: 'Prayer'),
        NavigationDestination(icon: Icon(Icons.touch_app_rounded), label: 'Tasbeeh'),
        NavigationDestination(icon: Icon(Icons.check_circle_rounded), label: 'Tracker'),
        NavigationDestination(icon: Icon(Icons.settings_rounded), label: 'Settings'),
      ],
    );
  }
}
