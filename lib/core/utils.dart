import 'package:kana_kit/kana_kit.dart';
import 'package:timeago/timeago.dart' as timeago;

class Utils {
  const Utils._();

  static KanaKit get kanaKit => const KanaKit();

  static String formatTimeWithTimeago(String createdAt) {
    final date = DateTime.parse(createdAt);
    return timeago.format(date);
  }

  static Iterable<String> isKanji(String kanji) {
    final texts = kanji.trim().split('');
    return texts.where((e) => kanaKit.isKanji(e));
  }

  static String toRomaji(String value) {
    return kanaKit.toRomaji(value);
  }
}
