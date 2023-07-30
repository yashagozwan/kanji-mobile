import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kanji_app/core/core.dart';
import 'package:kanji_app/presentation/detail/detail.dart';
import 'dart:developer' as dev;

import '../../domain/usecase/jisho_usecase.dart';

@singleton
class DetailCubit extends Cubit<DetailState> {
  final JishoUseCase _useCase;

  DetailCubit(this._useCase) : super(const DetailState());

  void setKanji(String kanji) => emit(state.copyWith(kanji: kanji));

  void started() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final kanjiModel = await _useCase.findOneByKanji(state.kanji);
      emit(state.copyWith(status: Status.success, kanjiModel: kanjiModel));
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
