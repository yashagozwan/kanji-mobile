import '../../../domain/model/japanese/japanese_model.dart';
import '../../../domain/model/kanji/kanji_model.dart';

abstract class JishoRemoteDataSouce {
  Future<KanjiModel> findOneByKanji(String kanji);

  Future<Iterable<JapaneseModel>> findOneByWord(String word);
}
