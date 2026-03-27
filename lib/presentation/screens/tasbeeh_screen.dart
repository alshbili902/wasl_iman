import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasl_iman/core/constants/context_x.dart';
import 'package:wasl_iman/presentation/providers/tasbeeh_provider.dart';
import 'package:wasl_iman/presentation/widgets/gradient_scaffold.dart';
import 'package:wasl_iman/presentation/widgets/premium_card.dart';

class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TasbeehProvider>();

    return GradientScaffold(
      appBar: AppBar(title: Text(context.l10n.t('tasbeeh'))),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          PremiumCard(
            child: Column(
              children: [
                Text(provider.currentPhrase.arabic, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                const SizedBox(height: 6),
                Text(provider.currentPhrase.transliteration),
                const SizedBox(height: 14),
                Text('${provider.count}', style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: provider.increment,
                    icon: const Icon(Icons.touch_app_rounded),
                    label: Text(context.l10n.t('increment')),
                  ),
                ),
                TextButton(onPressed: provider.reset, child: Text(context.l10n.t('reset'))),
              ],
            ),
          ),
          const SizedBox(height: 12),
          PremiumCard(
            child: Column(
              children: [
                for (int i = 0; i < provider.phrases.length; i++)
                  RadioListTile<int>(
                    value: i,
                    groupValue: provider.selectedPhraseIndex,
                    onChanged: (value) {
                      if (value != null) provider.selectPhrase(value);
                    },
                    title: Text(provider.phrases[i].arabic),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
