import 'package:flutter/material.dart';
import 'package:wasl_iman/core/constants/storage_keys.dart';
import 'package:wasl_iman/data/models/tasbeeh_phrase.dart';
import 'package:wasl_iman/data/services/local_storage_service.dart';
import 'package:wasl_iman/data/services/sample_data_service.dart';

class TasbeehProvider extends ChangeNotifier {
  final List<TasbeehPhrase> phrases = SampleDataService.tasbeehPhrases();

  int _count = 0;
  int _selectedPhraseIndex = 0;

  int get count => _count;
  int get selectedPhraseIndex => _selectedPhraseIndex;
  TasbeehPhrase get currentPhrase => phrases[_selectedPhraseIndex];

  Future<void> load() async {
    final storage = LocalStorageService.instance;
    _count = storage.getInt(StorageKeys.tasbeehCount) ?? 0;
    _selectedPhraseIndex = storage.getInt(StorageKeys.tasbeehPhraseIndex) ?? 0;
    if (_selectedPhraseIndex >= phrases.length) _selectedPhraseIndex = 0;
    notifyListeners();
  }

  Future<void> increment() async {
    _count++;
    await LocalStorageService.instance.setInt(StorageKeys.tasbeehCount, _count);
    notifyListeners();
  }

  Future<void> reset() async {
    _count = 0;
    await LocalStorageService.instance.setInt(StorageKeys.tasbeehCount, _count);
    notifyListeners();
  }

  Future<void> selectPhrase(int index) async {
    _selectedPhraseIndex = index;
    await LocalStorageService.instance.setInt(StorageKeys.tasbeehPhraseIndex, index);
    notifyListeners();
  }
}
