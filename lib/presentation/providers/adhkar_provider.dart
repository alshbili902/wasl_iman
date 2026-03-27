import 'package:flutter/material.dart';
import 'package:wasl_iman/core/constants/storage_keys.dart';
import 'package:wasl_iman/data/models/adhkar_item.dart';
import 'package:wasl_iman/data/services/local_storage_service.dart';
import 'package:wasl_iman/data/services/sample_data_service.dart';

class AdhkarProvider extends ChangeNotifier {
  final List<AdhkarItem> morning = SampleDataService.morningAdhkar();
  final List<AdhkarItem> evening = SampleDataService.eveningAdhkar();

  Map<String, int> _morningCounts = {};
  Map<String, int> _eveningCounts = {};

  Map<String, int> get morningCounts => _morningCounts;
  Map<String, int> get eveningCounts => _eveningCounts;

  Future<void> load() async {
    final storage = LocalStorageService.instance;
    _morningCounts = _fromMap(storage.getMap(StorageKeys.morningCounts));
    _eveningCounts = _fromMap(storage.getMap(StorageKeys.eveningCounts));
    notifyListeners();
  }

  int countFor(String id, {required bool isMorning}) {
    final map = isMorning ? _morningCounts : _eveningCounts;
    return map[id] ?? 0;
  }

  Future<void> increment(AdhkarItem item, {required bool isMorning}) async {
    final map = isMorning ? _morningCounts : _eveningCounts;
    final current = map[item.id] ?? 0;
    if (current >= item.targetCount) return;

    map[item.id] = current + 1;
    await _save(isMorning: isMorning);
    notifyListeners();
  }

  double sectionProgress({required bool isMorning}) {
    final items = isMorning ? morning : evening;
    final map = isMorning ? _morningCounts : _eveningCounts;

    int completed = 0;
    for (final item in items) {
      if ((map[item.id] ?? 0) >= item.targetCount) completed++;
    }
    return items.isEmpty ? 0 : completed / items.length;
  }

  Future<void> _save({required bool isMorning}) async {
    final key = isMorning ? StorageKeys.morningCounts : StorageKeys.eveningCounts;
    final map = (isMorning ? _morningCounts : _eveningCounts).map((key, value) => MapEntry(key, value));
    await LocalStorageService.instance.setMap(key, map);
  }

  Map<String, int> _fromMap(Map<String, dynamic>? input) {
    if (input == null) return {};
    return input.map((key, value) => MapEntry(key, value as int));
  }
}
