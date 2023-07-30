import 'package:freezed_annotation/freezed_annotation.dart';

import '../kanji_example/kanji_example_model.dart';

part 'kanji_model.freezed.dart';

part 'kanji_model.g.dart';

@freezed
class KanjiModel with _$KanjiModel {
  const factory KanjiModel({
    @Default('') String kanji,
    @Default('')  String jlptLevel,
    @Default([]) Iterable<String> kunyomi,
    @Default([]) Iterable<String> onyomi,
    @Default([]) Iterable<KanjiExampleModel> onyomiExamples,
    @Default([]) Iterable<KanjiExampleModel> kunyomiExamples,
    @Default(0) int strokeCount,
    @Default('') String meaning,
  }) = _KanjiModel;

  factory KanjiModel.fromJson(Map<String, dynamic> json) =>
      _$KanjiModelFromJson(json);
}
