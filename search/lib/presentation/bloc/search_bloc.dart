import 'package:movies/domain/entities/movie.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/search.dart';

part 'search_event.dart';
part 'search_state.dart';

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

class SearchMoviesBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies _searchMovies;
  SearchMoviesBloc(this._searchMovies) : super(SearchEmpty()) {
    on<OnQueryChanged>(
      (event, emit) async {
        final query = event.query;

        emit(SearchLoading());
        final result = await _searchMovies.execute(query);

        result.fold(
          (failure) {
            emit(SearchError(failure.message));
          },
          (data) {
            emit(SearchMoviesHasData(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

class SearchTvSeriesBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTvSeries _searchTvSeries;
  SearchTvSeriesBloc(this._searchTvSeries) : super(SearchEmpty()) {
    on<OnQueryChanged>(
      (event, emit) async {
        final query = event.query;

        emit(SearchLoading());
        final result = await _searchTvSeries.execute(query);

        result.fold(
          (failure) {
            emit(SearchError(failure.message));
          },
          (data) {
            emit(SearchTvSeriesHasData(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}
