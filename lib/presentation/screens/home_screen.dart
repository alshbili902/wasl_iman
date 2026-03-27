import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasl_iman/core/constants/context_x.dart';
import 'package:wasl_iman/core/router/app_router.dart';
import 'package:wasl_iman/presentation/providers/adhkar_provider.dart';
import 'package:wasl_iman/presentation/providers/prayer_times_provider.dart';
import 'package:wasl_iman/presentation/providers/wird_provider.dart';
import 'package:wasl_iman/presentation/providers/worship_tracker_provider.dart';
import 'package:wasl_iman/presentation/widgets/gradient_scaffold.dart';
import 'package:wasl_iman/presentation/widgets/premium_card.dart';
import 'package:wasl_iman/presentation/widgets/quick_action_card.dart';
import 'package:wasl_iman/presentation/widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final adhkar = context.watch<AdhkarProvider>();
    final prayer = context.watch<PrayerTimesProvider>();
    final wird = context.watch<WirdProvider>();
    final tracker = context.watch<WorshipTrackerProvider>();

    final morningProgress = adhkar.sectionProgress(isMorning: true);
    final eveningProgress = adhkar.sectionProgress(isMorning: false);

    return GradientScaffold(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(context.l10n.t('good_morning'), style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          PremiumCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n.t('todays_progress'), style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(12),
                  value: tracker.tracker.completionScore / 100,
                ),
                const SizedBox(height: 8),
                Text('${tracker.tracker.completionScore}%'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionHeader(title: context.l10n.t('quick_access')),
          QuickActionCard(
            title: context.l10n.t('morning_adhkar'),
            subtitle: '${(morningProgress * 100).round()}%',
            icon: Icons.wb_sunny_rounded,
            onTap: () => Navigator.pushNamed(context, AppRouter.morningAdhkar),
          ),
          const SizedBox(height: 10),
          QuickActionCard(
            title: context.l10n.t('evening_adhkar'),
            subtitle: '${(eveningProgress * 100).round()}%',
            icon: Icons.nights_stay_rounded,
            onTap: () => Navigator.pushNamed(context, AppRouter.eveningAdhkar),
          ),
          const SizedBox(height: 10),
          QuickActionCard(
            title: context.l10n.t('daily_wird'),
            subtitle: '${wird.progress}/${wird.goal}',
            icon: Icons.menu_book_rounded,
            onTap: () => Navigator.pushNamed(context, AppRouter.dailyWird),
          ),
          const SizedBox(height: 16),
          SectionHeader(title: context.l10n.t('prayer_preview')),
          PremiumCard(
            child: Text(
              prayer.times.isEmpty
                  ? '...'
                  : '${context.l10n.t(prayer.times.first.nameKey)} - ${prayer.times.first.time}',
            ),
          ),
        ],
      ),
    );
  }
}
