part of 'search_screen_cubit.dart';

@immutable
sealed class SearchScreenState {}

final class SearchScreenInitial extends SearchScreenState {}

final class SearchState extends SearchScreenState {
  final List<Object> searchResults;
  SearchState(this.searchResults);
}

final class SearchSuccess extends SearchScreenState {
  final List<CarEntity?> searchResults;
  SearchSuccess(this.searchResults);
}

final class SearchFailure extends SearchScreenState {
  final Failure failure;
  SearchFailure(this.failure);
}

final class SearchLoading extends SearchScreenState {}
