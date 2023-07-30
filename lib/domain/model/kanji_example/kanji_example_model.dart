import 'package:freezed_annotation/freezed_annotation.dart';

part 'kanji_example_model.freezed.dart';

part 'kanji_example_model.g.dart';

@freezed
class KanjiExampleModel with _$KanjiExampleModel {
  const factory KanjiExampleModel({
    @Default('') String example,
    @Default('') String reading,
    @Default('') String meaning,
    @Default('') String romaji,
  }) = _KanjiExampleModel;

  factory KanjiExampleModel.fromJson(Map<String, dynamic> json) =>
      _$KanjiExampleModelFromJson(json);
}
