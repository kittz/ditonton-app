import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class NowPlayingMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  NowPlayingMoviesBloc(this._getNowPlayingMovies)
      : super(NowPlayingMoviesEmpty()) {
    on<NowPlayingMovies>(
      (event, emit) async {
        emit(NowPlayingMoviesLoading());
        final result = await _getNowPlayingMovies.execute();

        result.fold(
          (failure) {
            emit(NowPlayingMoviesError(failure.message));
          },
          (data) {
            emit(NowPlayingMoviesHasData(data));
          },
        );
      },
    );
  }
}

class PopularMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPopularMovies _getPopularMovies;
  PopularMoviesBloc(this._getPopularMovies) : super(PopularMoviesEmpty()) {
    on<PopularMovies>(
      (event, emit) async {
        emit(PopularMoviesLoading());
        final result = await _getPopularMovies.execute();

        result.fold(
          (failure) {
            emit(PopularMoviesError(failure.message));
          },
          (data) {
            emit(PopularMoviesHasData(data));
          },
        );
      },
    );
  }
}

class TopRatedMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetTopRatedMovies _getTopRatedMovies;
  TopRatedMoviesBloc(this._getTopRatedMovies) : super(TopRatedMoviesEmpty()) {
    on<TopRatedMovies>(
      (event, emit) async {
        emit(TopRatedMoviesLoading());
        final result = await _getTopRatedMovies.execute();

        result.fold(
          (failure) {
            emit(TopRatedMoviesError(failure.message));
          },
          (data) {
            emit(TopRatedMoviesHasData(data));
          },
        );
      },
    );
  }
}

class MovieDetailBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovieDetail _getMovieDetail;
  MovieDetailBloc(this._getMovieDetail) : super(MovieDetailEmpty()) {
    on<MovieDetailEvent>(
      (event, emit) async {
        final id = event.id;

        emit(MovieDetailLoading());
        final result = await _getMovieDetail.execute(id);

        result.fold(
          (failure) {
            emit(MovieDetailError(failure.message));
          },
          (data) {
            emit(MovieDetailHasData(data));
          },
        );
      },
    );
  }
}

class MovieRecommendationsBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovieRecommendations _getMovieRecommendations;
  MovieRecommendationsBloc(this._getMovieRecommendations)
      : super(MovieRecommendationsEmpty()) {
    on<MovieRecommendations>(
      (event, emit) async {
        final id = event.id;

        emit(MovieRecommendationsLoading());
        final result = await _getMovieRecommendations.execute(id);

        result.fold(
          (failure) {
            emit(MovieRecommendationsError(failure.message));
          },
          (data) {
            emit(MovieRecommendationsHasData(data));
          },
        );
      },
    );
  }
}

class WatchlistMoviesBloc extends Bloc<MoviesEvent, WatchlistMoviesState> {
  final GetWatchlistMovies getWatchlistMovies;
  final GetWatchListStatus getWatchListStatusMovies;
  final RemoveWatchlist removeWatchlistMovies;
  final SaveWatchlist saveWatchlistMovies;
  WatchlistMoviesBloc({
    required this.getWatchlistMovies,
    required this.getWatchListStatusMovies,
    required this.removeWatchlistMovies,
    required this.saveWatchlistMovies,
  }) : super(WatchlistMoviesEmpty()) {
    on<WatchlistMovies>(
      (event, emit) async {
        emit(WatchlistMoviesLoading());
        final result = await getWatchlistMovies.execute();

        result.fold(
          (failure) {
            emit(WatchlistMoviesError(failure.message));
          },
          (data) {
            emit(WatchlistMoviesHasData(data));
          },
        );
      },
    );
    on<WatchlistMoviesStatus>(
      (event, emit) async {
        emit(WatchlistMoviesLoading());
        final result = await getWatchListStatusMovies.execute(event.id);

        emit(WatchlistMoviesStatusState(result));
      },
    );
    on<SaveWatchlistMovies>(
      (event, emit) async {
        final result = await saveWatchlistMovies.execute(event.movie);

        result.fold(
          (failure) {
            emit(WatchlistMoviesError(failure.message));
          },
          (data) {
            emit(WatchlistMoviesMessageState(data));
          },
        );
      },
    );
    on<RemoveWatchlistMovies>(
      (event, emit) async {
        final result = await removeWatchlistMovies.execute(event.movie);

        result.fold(
          (failure) {
            emit(WatchlistMoviesError(failure.message));
          },
          (data) {
            emit(WatchlistMoviesMessageState(data));
          },
        );
      },
    );
  }
}
