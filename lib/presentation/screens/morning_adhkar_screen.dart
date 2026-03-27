import 'package:flutter/material.dart';
import 'package:wasl_iman/presentation/screens/adhkar_screen.dart';

class MorningAdhkarScreen extends StatelessWidget {
  const MorningAdhkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdhkarScreen(isMorning: true, titleKey: 'morning_adhkar');
  }
}
