import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:kanji_app/core/auth_status.dart';
import '../../core/status.dart';
import '../../domain/usecase/user_usecase.dart';
import 'user.dart';

@singleton
class UserCubit extends Cubit<UserState> {
  final UserUseCase _useCase;

  UserCubit(this._useCase) : super(const UserState());

  void started() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final user = await _useCase.getAccount();
      emit(state.copyWith(
        status: Status.success,
        user: user,
        authStatus: AuthStatus.authenticated,
      ));
    } on HiveError {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void logout() async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _useCase.logoutGoogleAuth();
      emit(state.copyWith(
        status: Status.success,
        authStatus: AuthStatus.unauthenticated,
      ));
    } on FirebaseException {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
