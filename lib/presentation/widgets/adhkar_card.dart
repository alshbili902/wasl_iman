import 'package:flutter/material.dart';
import 'package:wasl_iman/data/models/adhkar_item.dart';
import 'package:wasl_iman/presentation/widgets/premium_card.dart';

class AdhkarCard extends StatelessWidget {
  const AdhkarCard({
    super.key,
    required this.item,
    required this.currentCount,
    required this.onIncrement,
  });

  final AdhkarItem item;
  final int currentCount;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    final done = currentCount >= item.targetCount;
    return PremiumCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.arabicText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.8),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          Text(item.reference, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 14),
          Row(
            children: [
              Text('$currentCount / ${item.targetCount}'),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: done ? null : onIncrement,
                icon: Icon(done ? Icons.check_circle : Icons.repeat),
                label: Text(done ? 'تم' : 'تكرار'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
