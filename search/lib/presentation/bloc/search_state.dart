part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchEmpty extends SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchMoviesHasData extends SearchState {
  final List<Movie> result;

  const SearchMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}

class SearchTvSeriesHasData extends SearchState {
  final List<TvSeries> result;

  const SearchTvSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}
