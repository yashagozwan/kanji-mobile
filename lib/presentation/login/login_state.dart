import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanji_app/core/status.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(Status.initial) Status status,
  }) = _LoginState;
}
