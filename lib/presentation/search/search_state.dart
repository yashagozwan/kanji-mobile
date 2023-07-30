import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/status.dart';
import '../../domain/model/japanese/japanese_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(Status.initial) Status status,
    @Default('') String search,
    @Default([]) Iterable<JapaneseModel> japaneses,
  }) = _SearchState;
}
