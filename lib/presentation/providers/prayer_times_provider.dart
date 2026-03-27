import 'package:flutter/material.dart';
import 'package:wasl_iman/data/models/prayer_time.dart';
import 'package:wasl_iman/data/services/prayer_times_service.dart';

class PrayerTimesProvider extends ChangeNotifier {
  final PrayerTimesService _service = PrayerTimesService();
  List<PrayerTime> _times = [];

  List<PrayerTime> get times => _times;

  Future<void> load() async {
    _times = await _service.getTodayPrayerTimes();
    notifyListeners();
  }
}
