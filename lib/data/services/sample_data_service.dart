import 'package:wasl_iman/data/models/adhkar_item.dart';
import 'package:wasl_iman/data/models/tasbeeh_phrase.dart';

class SampleDataService {
  static List<AdhkarItem> morningAdhkar() {
    return const [
      AdhkarItem(
        id: 'm1',
        arabicText: 'اللَّهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوتُ وَإِلَيْكَ النُّشُورُ',
        reference: 'رواه الترمذي',
        targetCount: 1,
      ),
      AdhkarItem(
        id: 'm2',
        arabicText: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
        reference: '100 مرة',
        targetCount: 100,
      ),
      AdhkarItem(
        id: 'm3',
        arabicText: 'أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ',
        reference: '100 مرة',
        targetCount: 100,
      ),
    ];
  }

  static List<AdhkarItem> eveningAdhkar() {
    return const [
      AdhkarItem(
        id: 'e1',
        arabicText: 'اللَّهُمَّ بِكَ أَمْسَيْنَا وَبِكَ أَصْبَحْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوتُ وَإِلَيْكَ المَصِيرُ',
        reference: 'رواه الترمذي',
        targetCount: 1,
      ),
      AdhkarItem(
        id: 'e2',
        arabicText: 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
        reference: '3 مرات',
        targetCount: 3,
      ),
      AdhkarItem(
        id: 'e3',
        arabicText: 'اللَّهُمَّ أَنْتَ رَبِّي لا إِلَهَ إِلا أَنْتَ خَلَقْتَنِي وَأَنَا عَبْدُكَ',
        reference: 'مرة واحدة',
        targetCount: 1,
      ),
    ];
  }

  static List<TasbeehPhrase> tasbeehPhrases() {
    return const [
      TasbeehPhrase(arabic: 'سُبْحَانَ الله', transliteration: 'Subhan Allah'),
      TasbeehPhrase(arabic: 'الحَمْدُ لله', transliteration: 'Alhamdulillah'),
      TasbeehPhrase(arabic: 'اللهُ أَكْبَر', transliteration: 'Allahu Akbar'),
      TasbeehPhrase(arabic: 'لا إله إلا الله', transliteration: 'La ilaha illa Allah'),
    ];
  }
}
