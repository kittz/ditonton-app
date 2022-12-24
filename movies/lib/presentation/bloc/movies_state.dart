part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

abstract class WatchlistMoviesState extends Equatable {
  const WatchlistMoviesState();

  @override
  List<Object> get props => [];
}

//NowPlayingMovies

class NowPlayingMoviesEmpty extends MoviesState {}

class NowPlayingMoviesLoading extends MoviesState {}

class NowPlayingMoviesError extends MoviesState {
  final String message;

  const NowPlayingMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class NowPlayingMoviesHasData extends MoviesState {
  final List<Movie> result;

  const NowPlayingMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}

//PopularMovies
class PopularMoviesEmpty extends MoviesState {}

class PopularMoviesLoading extends MoviesState {}

class PopularMoviesError extends MoviesState {
  final String message;

  const PopularMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class PopularMoviesHasData extends MoviesState {
  final List<Movie> result;

  const PopularMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}

//TopRatedMovies
class TopRatedMoviesEmpty extends MoviesState {}

class TopRatedMoviesLoading extends MoviesState {}

class TopRatedMoviesError extends MoviesState {
  final String message;

  const TopRatedMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class TopRatedMoviesHasData extends MoviesState {
  final List<Movie> result;

  const TopRatedMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}

//MovieDetail
class MovieDetailEmpty extends MoviesState {}

class MovieDetailLoading extends MoviesState {}

class MovieDetailError extends MoviesState {
  final String message;

  const MovieDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieDetailHasData extends MoviesState {
  final MovieDetail result;

  const MovieDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}

//MovieRecommendations
class MovieRecommendationsEmpty extends MoviesState {}

class MovieRecommendationsLoading extends MoviesState {}

class MovieRecommendationsError extends MoviesState {
  final String message;

  const MovieRecommendationsError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieRecommendationsHasData extends MoviesState {
  final List<Movie> result;

  const MovieRecommendationsHasData(this.result);

  @override
  List<Object> get props => [result];
}

//WatchlistMovies
class WatchlistMoviesEmpty extends WatchlistMoviesState {}

class WatchlistMoviesLoading extends WatchlistMoviesState {}

class WatchlistMoviesError extends WatchlistMoviesState {
  final String message;

  const WatchlistMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistMoviesHasData extends WatchlistMoviesState {
  final List<Movie> result;

  const WatchlistMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}

class WatchlistMoviesMessageState extends WatchlistMoviesState {
  final String message;

  const WatchlistMoviesMessageState(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistMoviesStatusState extends WatchlistMoviesState {
  final bool result;

  const WatchlistMoviesStatusState(this.result);

  @override
  List<Object> get props => [result];
}
