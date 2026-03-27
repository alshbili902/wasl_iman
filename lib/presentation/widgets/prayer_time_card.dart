import 'package:flutter/material.dart';
import 'package:wasl_iman/presentation/widgets/premium_card.dart';

class PrayerTimeCard extends StatelessWidget {
  const PrayerTimeCard({
    super.key,
    required this.name,
    required this.time,
    this.highlight = false,
  });

  final String name;
  final String time;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: highlight
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).dividerColor.withValues(alpha: 0.3),
          ),
        ),
        child: ListTile(
          leading: Icon(Icons.access_time_filled_rounded, color: Theme.of(context).colorScheme.primary),
          title: Text(name, style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(time, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    );
  }
}
