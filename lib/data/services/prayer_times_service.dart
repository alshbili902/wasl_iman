import 'package:wasl_iman/data/models/prayer_time.dart';

class PrayerTimesService {
  Future<List<PrayerTime>> getTodayPrayerTimes() async {
    return const [
      PrayerTime(nameKey: 'fajr', time: '04:57 AM'),
      PrayerTime(nameKey: 'dhuhr', time: '11:53 AM'),
      PrayerTime(nameKey: 'asr', time: '03:21 PM'),
      PrayerTime(nameKey: 'maghrib', time: '05:56 PM'),
      PrayerTime(nameKey: 'isha', time: '07:26 PM'),
    ];
  }
}
