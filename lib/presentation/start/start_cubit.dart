import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';
import 'package:kanji_app/core/auth_status.dart';
import '../../core/status.dart';
import 'start_state.dart';
import '../../domain/usecase/user_usecase.dart';

@singleton
class StartCubit extends Cubit<StartState> {
  final UserUseCase _useCase;

  StartCubit(this._useCase) : super(const StartState());

  void started() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result = await _useCase.isLoggedInGoogleAuth();
      if (result) {
        emit(state.copyWith(authStatus: AuthStatus.authenticated));
      } else {
        emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
      }

      emit(state.copyWith(status: Status.success));
    } on FirebaseAuthException {
      emit(state.copyWith(status: Status.failure));
    }

    FlutterNativeSplash.remove();
  }
}
