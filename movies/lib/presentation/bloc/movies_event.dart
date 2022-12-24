part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class NowPlayingMovies extends MoviesEvent {
  const NowPlayingMovies();

  @override
  List<Object> get props => [];
}

class PopularMovies extends MoviesEvent {
  const PopularMovies();

  @override
  List<Object> get props => [];
}

class TopRatedMovies extends MoviesEvent {
  const TopRatedMovies();

  @override
  List<Object> get props => [];
}

class MovieDetailEvent extends MoviesEvent {
  final int id;
  const MovieDetailEvent(this.id);

  @override
  List<Object> get props => [];
}

class MovieRecommendations extends MoviesEvent {
  final int id;
  const MovieRecommendations(this.id);

  @override
  List<Object> get props => [];
}

class WatchlistMovies extends MoviesEvent {
  const WatchlistMovies();

  @override
  List<Object> get props => [];
}

class WatchlistMoviesStatus extends MoviesEvent {
  final int id;
  const WatchlistMoviesStatus(this.id);

  @override
  List<Object> get props => [];
}

class RemoveWatchlistMovies extends MoviesEvent {
  final MovieDetail movie;
  const RemoveWatchlistMovies(this.movie);

  @override
  List<Object> get props => [];
}

class SaveWatchlistMovies extends MoviesEvent {
  final MovieDetail movie;
  const SaveWatchlistMovies(this.movie);

  @override
  List<Object> get props => [];
}
