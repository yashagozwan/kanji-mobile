import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_app/core/exception/kanji_exception.dart';
import 'package:kanji_app/data/repository/jisho_repository.dart';
import 'package:kanji_app/data/source/remote/jisho_api_remote_data_source.dart';
import 'package:kanji_app/domain/repository/i_jisho_repository.dart';

void main() {
  group('JishoRepository', () {
    late final IJishoRepository repo;

    setUpAll(() {
      final remote = JishoApiRemoteDataSource();
      repo = JishoRepository(remote);
    });

    test('find one by kanji', () async {
      try {
        final result = await repo.findOneByKanji('母');
      } on KanjiException catch (error) {
      }
    });


    test('find one by word', () async {
      try {
        await repo.findOneByWord('sister');
      } on KanjiException catch (error) {
      }
    });
  });
}
