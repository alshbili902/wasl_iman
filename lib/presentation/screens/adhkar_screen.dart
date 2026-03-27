import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasl_iman/core/constants/context_x.dart';
import 'package:wasl_iman/data/models/adhkar_item.dart';
import 'package:wasl_iman/presentation/providers/adhkar_provider.dart';
import 'package:wasl_iman/presentation/widgets/adhkar_card.dart';
import 'package:wasl_iman/presentation/widgets/gradient_scaffold.dart';

class AdhkarScreen extends StatelessWidget {
  const AdhkarScreen({
    super.key,
    required this.isMorning,
    required this.titleKey,
  });

  final bool isMorning;
  final String titleKey;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AdhkarProvider>();
    final items = isMorning ? provider.morning : provider.evening;

    return GradientScaffold(
      appBar: AppBar(title: Text(context.l10n.t(titleKey))),
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (_, index) {
          final item = items[index];
          final count = provider.countFor(item.id, isMorning: isMorning);
          return AdhkarCard(
            item: item,
            currentCount: count,
            onIncrement: () => _increment(context, provider, item),
          );
        },
      ),
    );
  }

  void _increment(BuildContext context, AdhkarProvider provider, AdhkarItem item) {
    provider.increment(item, isMorning: isMorning);
  }
}
