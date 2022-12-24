part of 'tv_series_bloc.dart';

abstract class TvSeriesState extends Equatable {
  const TvSeriesState();

  @override
  List<Object> get props => [];
}

abstract class WatchlistTvSeriesState extends Equatable {
  const WatchlistTvSeriesState();

  @override
  List<Object> get props => [];
}

//NowPlayingTvSeries

class NowPlayingTvSeriesEmpty extends TvSeriesState {}

class NowPlayingTvSeriesLoading extends TvSeriesState {}

class NowPlayingTvSeriesError extends TvSeriesState {
  final String message;

  const NowPlayingTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class NowPlayingTvSeriesHasData extends TvSeriesState {
  final List<TvSeries> result;

  const NowPlayingTvSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}

//PopularTvSeries
class PopularTvSeriesEmpty extends TvSeriesState {}

class PopularTvSeriesLoading extends TvSeriesState {}

class PopularTvSeriesError extends TvSeriesState {
  final String message;

  const PopularTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class PopularTvSeriesHasData extends TvSeriesState {
  final List<TvSeries> result;

  const PopularTvSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}

//TopRatedTvSeries
class TopRatedTvSeriesEmpty extends TvSeriesState {}

class TopRatedTvSeriesLoading extends TvSeriesState {}

class TopRatedTvSeriesError extends TvSeriesState {
  final String message;

  const TopRatedTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class TopRatedTvSeriesHasData extends TvSeriesState {
  final List<TvSeries> result;

  const TopRatedTvSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}

//TvSeriesDetail
class TvSeriesDetailEmpty extends TvSeriesState {}

class TvSeriesDetailLoading extends TvSeriesState {}

class TvSeriesDetailError extends TvSeriesState {
  final String message;

  const TvSeriesDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class TvSeriesDetailHasData extends TvSeriesState {
  final TvSeriesDetail result;

  const TvSeriesDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}

//TvSeriesRecommendations
class TvSeriesRecommendationsEmpty extends TvSeriesState {}

class TvSeriesRecommendationsLoading extends TvSeriesState {}

class TvSeriesRecommendationsError extends TvSeriesState {
  final String message;

  const TvSeriesRecommendationsError(this.message);

  @override
  List<Object> get props => [message];
}

class TvSeriesRecommendationsHasData extends TvSeriesState {
  final List<TvSeries> result;

  const TvSeriesRecommendationsHasData(this.result);

  @override
  List<Object> get props => [result];
}

//WatchlistTvSeries
class WatchlistTvSeriesEmpty extends WatchlistTvSeriesState {}

class WatchlistTvSeriesLoading extends WatchlistTvSeriesState {}

class WatchlistTvSeriesError extends WatchlistTvSeriesState {
  final String message;

  const WatchlistTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistTvSeriesHasData extends WatchlistTvSeriesState {
  final List<TvSeries> result;

  const WatchlistTvSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}

class WatchlistTvSeriesMessageState extends WatchlistTvSeriesState {
  final String message;

  const WatchlistTvSeriesMessageState(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistTvSeriesStatusState extends WatchlistTvSeriesState {
  final bool result;

  const WatchlistTvSeriesStatusState(this.result);

  @override
  List<Object> get props => [result];
}
