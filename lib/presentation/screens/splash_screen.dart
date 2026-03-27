import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasl_iman/core/constants/app_constants.dart';
import 'package:wasl_iman/core/constants/context_x.dart';
import 'package:wasl_iman/core/router/app_router.dart';
import 'package:wasl_iman/presentation/providers/app_settings_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: AppConstants.splashDelayMs), _goNext);
  }

  void _goNext() {
    if (!mounted) return;
    final settings = context.read<AppSettingsProvider>();
    final route = settings.onboardingSeen ? AppRouter.shell : AppRouter.onboarding;
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0C5E4F), Color(0xFF0A3E36)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.auto_awesome, size: 72, color: Color(0xFFD6B16B)),
              const SizedBox(height: 16),
              Text('وصل إيمان', style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white)),
              const SizedBox(height: 8),
              Text(context.l10n.t('premium_subtitle'), style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}
