class WorshipTracker {
  WorshipTracker({
    required this.prayerChecks,
    required this.adhkarComplete,
    required this.quranComplete,
  });

  final Map<String, bool> prayerChecks;
  final bool adhkarComplete;
  final bool quranComplete;

  int get completionScore {
    final completedPrayers = prayerChecks.values.where((value) => value).length;
    final additional = (adhkarComplete ? 1 : 0) + (quranComplete ? 1 : 0);
    return ((completedPrayers + additional) / 7 * 100).round();
  }
}
