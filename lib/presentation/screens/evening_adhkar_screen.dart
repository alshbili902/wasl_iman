import 'package:flutter/material.dart';
import 'package:wasl_iman/presentation/screens/adhkar_screen.dart';

class EveningAdhkarScreen extends StatelessWidget {
  const EveningAdhkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdhkarScreen(isMorning: false, titleKey: 'evening_adhkar');
  }
}
