import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_event.dart';
part 'tv_series_state.dart';

class NowPlayingTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetNowPlayingTvSeries _getNowPlayingTvSeries;
  NowPlayingTvSeriesBloc(this._getNowPlayingTvSeries)
      : super(NowPlayingTvSeriesEmpty()) {
    on<NowPlayingTvSeries>(
      (event, emit) async {
        emit(NowPlayingTvSeriesLoading());
        final result = await _getNowPlayingTvSeries.execute();

        result.fold(
          (failure) {
            emit(NowPlayingTvSeriesError(failure.message));
          },
          (data) {
            emit(NowPlayingTvSeriesHasData(data));
          },
        );
      },
    );
  }
}

class PopularTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetPopularTvSeries _getPopularTvSeries;
  PopularTvSeriesBloc(this._getPopularTvSeries)
      : super(PopularTvSeriesEmpty()) {
    on<PopularTvSeries>(
      (event, emit) async {
        emit(PopularTvSeriesLoading());
        final result = await _getPopularTvSeries.execute();

        result.fold(
          (failure) {
            emit(PopularTvSeriesError(failure.message));
          },
          (data) {
            emit(PopularTvSeriesHasData(data));
          },
        );
      },
    );
  }
}

class TopRatedTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetTopRatedTvSeries _getTopRatedTvSeries;
  TopRatedTvSeriesBloc(this._getTopRatedTvSeries)
      : super(TopRatedTvSeriesEmpty()) {
    on<TopRatedTvSeries>(
      (event, emit) async {
        emit(TopRatedTvSeriesLoading());
        final result = await _getTopRatedTvSeries.execute();

        result.fold(
          (failure) {
            emit(TopRatedTvSeriesError(failure.message));
          },
          (data) {
            emit(TopRatedTvSeriesHasData(data));
          },
        );
      },
    );
  }
}

class TvSeriesDetailBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetTvSeriesDetail _getTvSeriesDetail;
  TvSeriesDetailBloc(this._getTvSeriesDetail) : super(TvSeriesDetailEmpty()) {
    on<TvSeriesDetailEvent>(
      (event, emit) async {
        final id = event.id;

        emit(TvSeriesDetailLoading());
        final result = await _getTvSeriesDetail.execute(id);

        result.fold(
          (failure) {
            emit(TvSeriesDetailError(failure.message));
          },
          (data) {
            emit(TvSeriesDetailHasData(data));
          },
        );
      },
    );
  }
}

class TvSeriesRecommendationsBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetTvSeriesRecommendations _getTvSeriesRecommendations;
  TvSeriesRecommendationsBloc(this._getTvSeriesRecommendations)
      : super(TvSeriesRecommendationsEmpty()) {
    on<TvSeriesRecommendations>(
      (event, emit) async {
        final id = event.id;

        emit(TvSeriesRecommendationsLoading());
        final result = await _getTvSeriesRecommendations.execute(id);

        result.fold(
          (failure) {
            emit(TvSeriesRecommendationsError(failure.message));
          },
          (data) {
            emit(TvSeriesRecommendationsHasData(data));
          },
        );
      },
    );
  }
}

class WatchlistTvSeriesBloc
    extends Bloc<TvSeriesEvent, WatchlistTvSeriesState> {
  final GetWatchlistTvSeries getWatchlistTvSeries;
  final GetWatchListStatusTvSeries getWatchListStatusTvSeries;
  final RemoveWatchlistTvSeries removeWatchlistTvSeries;
  final SaveWatchlistTvSeries saveWatchlistTvSeries;
  WatchlistTvSeriesBloc({
    required this.getWatchlistTvSeries,
    required this.getWatchListStatusTvSeries,
    required this.removeWatchlistTvSeries,
    required this.saveWatchlistTvSeries,
  }) : super(WatchlistTvSeriesEmpty()) {
    on<WatchlistTvSeries>(
      (event, emit) async {
        emit(WatchlistTvSeriesLoading());
        final result = await getWatchlistTvSeries.execute();

        result.fold(
          (failure) {
            emit(WatchlistTvSeriesError(failure.message));
          },
          (data) {
            emit(WatchlistTvSeriesHasData(data));
          },
        );
      },
    );
    on<WatchlistTvSeriesStatus>(
      (event, emit) async {
        emit(WatchlistTvSeriesLoading());
        final result = await getWatchListStatusTvSeries.execute(event.id);

        emit(WatchlistTvSeriesStatusState(result));
      },
    );
    on<SaveWatchlistTvSeriesEvent>(
      (event, emit) async {
        final result = await saveWatchlistTvSeries.execute(event.tvSeries);

        result.fold(
          (failure) {
            emit(WatchlistTvSeriesError(failure.message));
          },
          (data) {
            emit(WatchlistTvSeriesMessageState(data));
          },
        );
      },
    );
    on<RemoveWatchlistTvSeriesEvent>(
      (event, emit) async {
        final result = await removeWatchlistTvSeries.execute(event.tvSeries);

        result.fold(
          (failure) {
            emit(WatchlistTvSeriesError(failure.message));
          },
          (data) {
            emit(WatchlistTvSeriesMessageState(data));
          },
        );
      },
    );
  }
}
