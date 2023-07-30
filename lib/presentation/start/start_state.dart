import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/auth_status.dart';
import '../../core/status.dart';

part 'start_state.freezed.dart';

@freezed
class StartState with _$StartState {
  const factory StartState({
    @Default(Status.initial) Status status,
    @Default(AuthStatus.unauthenticated) AuthStatus authStatus,
  }) = _StartState;
}
