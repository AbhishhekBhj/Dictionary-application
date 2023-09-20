import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dictionary/model/dictionary_response_model.dart';
import 'package:dictionary/repository/dictionary_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final DictionaryRepository _repository;
  DictionaryCubit(this._repository) : super(NoQueryMadeState());
  final wordController = TextEditingController();

  Future getSearchedWord() async {
    emit(WordSearchingState()); //indicates user searches for word

    try {
      final words =
          await _repository.getDictionaryResponse(wordController.text);

      if (words.isNotEmpty) {
        print(words.toString());
        emit(WordSearchingSuccessState(words));
      } else {
        emit(WordSearchingErrorState("Unexpected Error Occured"));
      }
    } on Exception catch (e) {
      emit(WordSearchingErrorState(
          e.toString())); //emit error state with exception as error message
    }
  }
}
