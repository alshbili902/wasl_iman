import 'package:flutter/material.dart';
import 'package:wasl_iman/core/constants/storage_keys.dart';
import 'package:wasl_iman/data/services/local_storage_service.dart';

class WirdProvider extends ChangeNotifier {
  int _goal = 4;
  int _progress = 0;

  int get goal => _goal;
  int get progress => _progress;
  double get completion => _goal == 0 ? 0 : (_progress / _goal).clamp(0.0, 1.0);

  Future<void> load() async {
    final storage = LocalStorageService.instance;
    _goal = storage.getInt(StorageKeys.dailyQuranGoal) ?? 4;
    _progress = storage.getInt(StorageKeys.dailyQuranProgress) ?? 0;
    notifyListeners();
  }

  Future<void> setGoal(int pages) async {
    _goal = pages;
    if (_progress > _goal) _progress = _goal;
    await LocalStorageService.instance.setInt(StorageKeys.dailyQuranGoal, _goal);
    await LocalStorageService.instance.setInt(StorageKeys.dailyQuranProgress, _progress);
    notifyListeners();
  }

  Future<void> incrementProgress() async {
    if (_progress >= _goal) return;
    _progress++;
    await LocalStorageService.instance.setInt(StorageKeys.dailyQuranProgress, _progress);
    notifyListeners();
  }

  Future<void> resetProgress() async {
    _progress = 0;
    await LocalStorageService.instance.setInt(StorageKeys.dailyQuranProgress, _progress);
    notifyListeners();
  }
}
