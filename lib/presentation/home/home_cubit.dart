import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:kanji_app/presentation/home/home_state.dart';

import '../../core/status.dart';
import '../../domain/usecase/user_usecase.dart';

@singleton
class HomeCubit extends Cubit<HomeState> {
  final UserUseCase _useCase;

  HomeCubit(this._useCase) : super(const HomeState());

  void started() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final user = await _useCase.getAccount();
      emit(state.copyWith(status: Status.success, user: user));
    } on HiveError {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void setIndex(int value) => emit(state.copyWith(index: value));

  void reset() => emit(const HomeState());
}
