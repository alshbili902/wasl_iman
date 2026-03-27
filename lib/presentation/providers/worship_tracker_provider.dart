import 'package:flutter/material.dart';
import 'package:wasl_iman/core/constants/storage_keys.dart';
import 'package:wasl_iman/data/models/worship_tracker.dart';
import 'package:wasl_iman/data/services/local_storage_service.dart';

class WorshipTrackerProvider extends ChangeNotifier {
  WorshipTracker _tracker = WorshipTracker(
    prayerChecks: {
      'fajr': false,
      'dhuhr': false,
      'asr': false,
      'maghrib': false,
      'isha': false,
    },
    adhkarComplete: false,
    quranComplete: false,
  );

  WorshipTracker get tracker => _tracker;

  Future<void> load() async {
    final storage = LocalStorageService.instance;
    final prayerMap = storage.getMap(StorageKeys.prayerChecks);

    if (prayerMap != null) {
      _tracker = WorshipTracker(
        prayerChecks: prayerMap.map((key, value) => MapEntry(key, value as bool)),
        adhkarComplete: storage.getBool(StorageKeys.trackerAdhkar) ?? false,
        quranComplete: storage.getBool(StorageKeys.trackerQuran) ?? false,
      );
    }
    notifyListeners();
  }

  Future<void> togglePrayer(String prayer, bool value) async {
    _tracker.prayerChecks[prayer] = value;
    await _save();
    notifyListeners();
  }

  Future<void> toggleAdhkar(bool value) async {
    _tracker = WorshipTracker(
      prayerChecks: _tracker.prayerChecks,
      adhkarComplete: value,
      quranComplete: _tracker.quranComplete,
    );
    await _save();
    notifyListeners();
  }

  Future<void> toggleQuran(bool value) async {
    _tracker = WorshipTracker(
      prayerChecks: _tracker.prayerChecks,
      adhkarComplete: _tracker.adhkarComplete,
      quranComplete: value,
    );
    await _save();
    notifyListeners();
  }

  Future<void> _save() async {
    await LocalStorageService.instance.setMap(
      StorageKeys.prayerChecks,
      _tracker.prayerChecks.map((key, value) => MapEntry(key, value)),
    );
    await LocalStorageService.instance.setBool(StorageKeys.trackerAdhkar, _tracker.adhkarComplete);
    await LocalStorageService.instance.setBool(StorageKeys.trackerQuran, _tracker.quranComplete);
  }
}
