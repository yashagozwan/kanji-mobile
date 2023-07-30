import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kanji_app/core/status.dart';
import 'package:kanji_app/domain/usecase/user_usecase.dart';
import 'login_state.dart';

@singleton
class LoginCubit extends Cubit<LoginState> {
  final UserUseCase _usecase;

  LoginCubit(this._usecase) : super(const LoginState());

  void login() async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _usecase.loginWithGoogle();
      emit(state.copyWith(status: Status.success));
    } on FirebaseException catch (e) {
      emit(state.copyWith(status: Status.failure));
      debugPrint(e.message);
    }
  }

  void logout() async {
    final result = await _usecase.logoutGoogleAuth();
    emit(const LoginState());
    debugPrint('logout: $result');
  }
}
