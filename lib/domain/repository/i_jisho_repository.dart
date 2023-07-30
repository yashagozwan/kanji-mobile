import '../model/japanese/japanese_model.dart';
import '../model/kanji/kanji_model.dart';

abstract class IJishoRepository {
  Future<KanjiModel> findOneByKanji(String kanji);

  Future<Iterable<JapaneseModel>> findOneByWord(String word);
}
