import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kanji_app/core/status.dart';
import 'package:kanji_app/presentation/search/search.dart';

import '../../domain/usecase/jisho_usecase.dart';

@singleton
class SearchCubit extends Cubit<SearchState> {
  final JishoUseCase _useCase;

  SearchCubit(this._useCase) : super(const SearchState());

  void reset() => emit(const SearchState());

  final cSearch = TextEditingController();

  void clearSearchText() {
    emit(state.copyWith(search: '', japaneses: []));
    cSearch.clear();
  }

  void started() {
    cSearch.addListener(() {
      emit(state.copyWith(search: cSearch.text));
    });
  }

  void findOneByWord() async {
    emit(state.copyWith(japaneses: []));
    emit(state.copyWith(status: Status.loading));
    try {
      final japaneses = await _useCase.findOneByWord(state.search);
      emit(state.copyWith(
        status: Status.success,
        japaneses: japaneses,
      ));
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Timer? _timer;

  void search() {
    _stopTimer();
    _timer = Timer(
        const Duration(milliseconds: 1000),
        () => state.search.isEmpty
            ? emit(state.copyWith(japaneses: [], status: Status.success))
            : findOneByWord());
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }

  @override
  Future<void> close() {
    cSearch.dispose();
    _timer?.cancel();
    return super.close();
  }
}
