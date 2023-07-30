import 'package:freezed_annotation/freezed_annotation.dart';

part 'japanese_model.freezed.dart';

part 'japanese_model.g.dart';

@freezed
class JapaneseModel with _$JapaneseModel {
  const factory JapaneseModel({
    @Default('') String jlpt,
    @Default('') String word,
    @Default('') String reading,
    @Default('') String romaji,
  }) = _JapaneseModel;

  factory JapaneseModel.fromJson(Map<String, dynamic> json) =>
      _$JapaneseModelFromJson(json);
}
