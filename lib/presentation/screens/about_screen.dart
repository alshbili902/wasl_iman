import 'package:flutter/material.dart';
import 'package:wasl_iman/core/constants/context_x.dart';
import 'package:wasl_iman/presentation/widgets/gradient_scaffold.dart';
import 'package:wasl_iman/presentation/widgets/premium_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(title: Text(context.l10n.t('about'))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: PremiumCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('وصل إيمان', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Text(context.l10n.t('about_body'), style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 12),
              Text('Version 1.0.0', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
