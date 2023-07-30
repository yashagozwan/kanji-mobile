import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanji_app/core/auth_status.dart';
import 'package:kanji_app/core/status.dart';
import 'package:kanji_app/domain/model/user/user_model.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(Status.initial) Status status,
    @Default(UserModel()) UserModel user,
    @Default(AuthStatus.unauthenticated) AuthStatus authStatus,
  }) = _UserState;
}
