import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasl_iman/core/constants/context_x.dart';
import 'package:wasl_iman/presentation/providers/wird_provider.dart';
import 'package:wasl_iman/presentation/widgets/gradient_scaffold.dart';
import 'package:wasl_iman/presentation/widgets/premium_card.dart';

class DailyWirdScreen extends StatefulWidget {
  const DailyWirdScreen({super.key});

  @override
  State<DailyWirdScreen> createState() => _DailyWirdScreenState();
}

class _DailyWirdScreenState extends State<DailyWirdScreen> {
  final TextEditingController _goalController = TextEditingController();

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WirdProvider>();
    _goalController.text = provider.goal.toString();

    return GradientScaffold(
      appBar: AppBar(title: Text(context.l10n.t('daily_wird'))),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          PremiumCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n.t('goal_pages')),
                const SizedBox(height: 8),
                TextField(
                  controller: _goalController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final pages = int.tryParse(_goalController.text) ?? provider.goal;
                      provider.setGoal(pages.clamp(1, 50));
                    },
                    child: Text(context.l10n.t('save')),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          PremiumCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${context.l10n.t('completed_today')}: ${provider.progress}/${provider.goal}'),
                const SizedBox(height: 10),
                LinearProgressIndicator(value: provider.completion, minHeight: 10, borderRadius: BorderRadius.circular(10)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: provider.incrementProgress,
                        child: Text(context.l10n.t('mark_done')),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: provider.resetProgress,
                        child: Text(context.l10n.t('reset')),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
