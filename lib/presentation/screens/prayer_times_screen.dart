import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasl_iman/core/constants/context_x.dart';
import 'package:wasl_iman/presentation/providers/prayer_times_provider.dart';
import 'package:wasl_iman/presentation/widgets/gradient_scaffold.dart';
import 'package:wasl_iman/presentation/widgets/prayer_time_card.dart';
import 'package:wasl_iman/presentation/widgets/premium_card.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PrayerTimesProvider>();

    return GradientScaffold(
      appBar: AppBar(title: Text(context.l10n.t('prayer_times'))),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          for (int i = 0; i < provider.times.length; i++) ...[
            PrayerTimeCard(
              name: context.l10n.t(provider.times[i].nameKey),
              time: provider.times[i].time,
              highlight: i == 0,
            ),
            const SizedBox(height: 10),
          ],
          PremiumCard(
            child: ListTile(
              leading: const Icon(Icons.explore_rounded),
              title: Text(context.l10n.t('qibla_placeholder')),
              subtitle: const Text('v2 feature preparation'),
            ),
          ),
        ],
      ),
    );
  }
}
