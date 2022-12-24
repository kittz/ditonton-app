part of 'tv_series_bloc.dart';

abstract class TvSeriesEvent extends Equatable {
  const TvSeriesEvent();

  @override
  List<Object> get props => [];
}

class NowPlayingTvSeries extends TvSeriesEvent {
  const NowPlayingTvSeries();

  @override
  List<Object> get props => [];
}

class PopularTvSeries extends TvSeriesEvent {
  const PopularTvSeries();

  @override
  List<Object> get props => [];
}

class TopRatedTvSeries extends TvSeriesEvent {
  const TopRatedTvSeries();

  @override
  List<Object> get props => [];
}

class TvSeriesDetailEvent extends TvSeriesEvent {
  final int id;
  const TvSeriesDetailEvent(this.id);

  @override
  List<Object> get props => [];
}

class TvSeriesRecommendations extends TvSeriesEvent {
  final int id;
  const TvSeriesRecommendations(this.id);

  @override
  List<Object> get props => [];
}

class WatchlistTvSeries extends TvSeriesEvent {
  const WatchlistTvSeries();

  @override
  List<Object> get props => [];
}

class WatchlistTvSeriesStatus extends TvSeriesEvent {
  final int id;
  const WatchlistTvSeriesStatus(this.id);

  @override
  List<Object> get props => [];
}

class RemoveWatchlistTvSeriesEvent extends TvSeriesEvent {
  final TvSeriesDetail tvSeries;
  const RemoveWatchlistTvSeriesEvent(this.tvSeries);

  @override
  List<Object> get props => [];
}

class SaveWatchlistTvSeriesEvent extends TvSeriesEvent {
  final TvSeriesDetail tvSeries;
  const SaveWatchlistTvSeriesEvent(this.tvSeries);

  @override
  List<Object> get props => [];
}
