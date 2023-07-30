import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanji_app/core/core.dart';
import 'package:kanji_app/domain/model/kanji/kanji_model.dart';

part 'detail_state.freezed.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState({
    @Default(Status.initial) Status status,
    @Default('') String kanji,
    @Default(KanjiModel()) KanjiModel kanjiModel,
  }) = _DetailState;
}
