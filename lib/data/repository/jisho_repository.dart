import 'package:injectable/injectable.dart';
import 'package:kanji_app/domain/model/japanese/japanese_model.dart';

import '../../domain/model/kanji/kanji_model.dart';
import '../../domain/repository/i_jisho_repository.dart';
import '../source/remote/jisho_remote_data_source.dart';

@Singleton(as: IJishoRepository)
class JishoRepository implements IJishoRepository {
  final JishoRemoteDataSouce _remote;

  JishoRepository(this._remote);

  @override
  Future<KanjiModel> findOneByKanji(String kanji) =>
      _remote.findOneByKanji(kanji);

  @override
  Future<Iterable<JapaneseModel>> findOneByWord(String word) =>
      _remote.findOneByWord(word);
}
