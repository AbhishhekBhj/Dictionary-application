part of 'dictionary_cubit.dart';

@immutable
sealed class DictionaryState {}

final class DictionaryInitial extends DictionaryState {}

final class NoQueryMadeState
    extends DictionaryState {} //when nothing is searched

final class WordSearchingState extends DictionaryState {} //loading state

final class WordSearchingSuccessState extends DictionaryState {
  //word found state
  final List<DictionaryResponse> words;
  WordSearchingSuccessState(this.words);
}

final class WordSearchingErrorState extends DictionaryState {
  final errorMessage;

  WordSearchingErrorState(this.errorMessage);
} //error occured state
