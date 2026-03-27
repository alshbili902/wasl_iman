import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasl_iman/core/constants/context_x.dart';
import 'package:wasl_iman/presentation/providers/worship_tracker_provider.dart';
import 'package:wasl_iman/presentation/widgets/gradient_scaffold.dart';
import 'package:wasl_iman/presentation/widgets/premium_card.dart';

class WorshipTrackerScreen extends StatelessWidget {
  const WorshipTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WorshipTrackerProvider>();
    final tracker = provider.tracker;

    return GradientScaffold(
      appBar: AppBar(title: Text(context.l10n.t('tracker'))),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          PremiumCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n.t('daily_summary'), style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: tracker.completionScore / 100,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(height: 8),
                Text('${tracker.completionScore}%'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          PremiumCard(
            child: Column(
              children: [
                for (final entry in tracker.prayerChecks.entries)
                  CheckboxListTile(
                    value: entry.value,
                    onChanged: (value) => provider.togglePrayer(entry.key, value ?? false),
                    title: Text(context.l10n.t(entry.key)),
                  ),
                CheckboxListTile(
                  value: tracker.adhkarComplete,
                  onChanged: (value) => provider.toggleAdhkar(value ?? false),
                  title: Text(context.l10n.t('adhkar')),
                ),
                CheckboxListTile(
                  value: tracker.quranComplete,
                  onChanged: (value) => provider.toggleQuran(value ?? false),
                  title: Text(context.l10n.t('daily_wird')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
