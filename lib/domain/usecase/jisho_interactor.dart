import 'package:injectable/injectable.dart';
import '../model/japanese/japanese_model.dart';
import '../model/kanji/kanji_model.dart';
import '../repository/i_jisho_repository.dart';
import 'jisho_usecase.dart';

@Singleton(as: JishoUseCase)
class JishoIteractor implements JishoUseCase {
  final IJishoRepository _jishoRepository;

  JishoIteractor(this._jishoRepository);

  @override
  Future<KanjiModel> findOneByKanji(String kanji) {
    return _jishoRepository.findOneByKanji(kanji);
  }

  @override
  Future<Iterable<JapaneseModel>> findOneByWord(String word) =>
      _jishoRepository.findOneByWord(word);
}
