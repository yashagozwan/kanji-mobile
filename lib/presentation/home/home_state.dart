import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/model/user/user_model.dart';
import '../../core/status.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Status.initial) Status status,
    @Default(UserModel()) UserModel user,
    @Default(0) int index,
  }) = _HomeState;
}
