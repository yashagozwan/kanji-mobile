import 'dart:convert';
import 'dart:developer' as dev;
import 'package:injectable/injectable.dart';
import 'package:kanji_app/core/exception/kanji_exception.dart';
import 'package:kanji_app/domain/model/japanese/japanese_model.dart';
import '../../../domain/model/kanji/kanji_model.dart';
import 'jisho_remote_data_source.dart';
import 'package:unofficial_jisho_api/api.dart' as jisho;
import 'package:kana_kit/kana_kit.dart' as kana;
import 'package:translator/translator.dart' as translator;

@Singleton(as: JishoRemoteDataSouce)
class JishoApiRemoteDataSource implements JishoRemoteDataSouce {
  kana.KanaKit get _kataKit => const kana.KanaKit();

  translator.GoogleTranslator get _translator => translator.GoogleTranslator();

  @override
  Future<KanjiModel> findOneByKanji(String kanji) async {
    final response = await jisho.searchForKanji(kanji);
    final data = response.data;

    if (!response.found || data == null) {
      throw const KanjiException('Kanji not found');
    }

    var onyomiExamples = data.onyomiExamples
        .map((e) => <String, dynamic>{
              'example': e.example,
              'reading': e.reading,
              'meaning': e.meaning,
              'romaji': _kataKit.toRomaji(e.reading),
            })
        .toList();

    var kunyomiExamples = data.kunyomiExamples
        .map((e) => {
              'example': e.example,
              'reading': e.reading,
              'meaning': e.meaning,
              'romaji': _kataKit.toRomaji(e.reading),
            })
        .toList();

    final json = {
      'kanji': data.kanji,
      'kunyomi': data.kunyomi,
      'onyomi': data.onyomi,
      'jlptLevel': data.jlptLevel,
      'onyomiExamples': onyomiExamples,
      'kunyomiExamples': kunyomiExamples,
      'strokeCount': data.strokeCount,
      'meaning': data.meaning,
    };

    return KanjiModel.fromJson(json);
  }

  @override
  Future<Iterable<JapaneseModel>> findOneByWord(String word) async {
    try {
      final translatorRes = await _translator.translate(word, to: 'en');
      final result = await jisho.searchForPhrase(translatorRes.text);
      final data = result.data ?? [];

      final japaneses = data.expand((kanji) => kanji.japanese
              .where((japanese) => japanese.word != null)
              .where((e) => e.word!.length <= 4)
              .map((e) {
            String value = '';

            final jlpt = kanji.jlpt.firstOrNull;

            if (jlpt != null) {
              value = jlpt.split('-').last.toUpperCase();
            }

            return JapaneseModel(
              jlpt: value,
              word: '${e.word}',
              reading: '${e.reading}',
              romaji: _kataKit.toRomaji('${e.reading}'),
            );
          }));

      return japaneses;
    } catch (e) {
      rethrow;
    }
  }
}
