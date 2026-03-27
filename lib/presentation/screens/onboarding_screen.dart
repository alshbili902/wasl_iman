import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasl_iman/core/constants/context_x.dart';
import 'package:wasl_iman/core/router/app_router.dart';
import 'package:wasl_iman/presentation/providers/app_settings_provider.dart';
import 'package:wasl_iman/presentation/widgets/gradient_scaffold.dart';
import 'package:wasl_iman/presentation/widgets/premium_card.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  Future<void> _finish() async {
    await context.read<AppSettingsProvider>().completeOnboarding();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, AppRouter.shell);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      (_k('onboarding_title_1'), _k('onboarding_body_1'), Icons.self_improvement),
      (_k('onboarding_title_2'), _k('onboarding_body_2'), Icons.track_changes),
      (_k('onboarding_title_3'), _k('onboarding_body_3'), Icons.volunteer_activism),
    ];

    return GradientScaffold(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(onPressed: _finish, child: Text(context.l10n.t('skip'))),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (value) => setState(() => _index = value),
                itemBuilder: (_, i) {
                  final page = pages[i];
                  return Center(
                    child: PremiumCard(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(radius: 44, child: Icon(page.$3, size: 36)),
                          const SizedBox(height: 18),
                          Text(page.$1, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                          const SizedBox(height: 8),
                          Text(page.$2, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _index == i ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _index == i ? Theme.of(context).colorScheme.primary : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _index == 2
                    ? _finish
                    : () => _controller.nextPage(duration: const Duration(milliseconds: 260), curve: Curves.easeOut),
                child: Text(_index == 2 ? context.l10n.t('start_now') : context.l10n.t('continue')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _k(String key) => context.l10n.t(key);
}
