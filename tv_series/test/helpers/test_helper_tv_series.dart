import 'package:core/core.dart';
import 'package:core/data/datasources/db/database_helper.dart';
import 'package:tv_series/tv_series.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  TvSeriesRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
  DatabaseHelper,
  GetTvSeriesDetail,
  GetNowPlayingTvSeries,
  GetPopularTvSeries,
  GetTvSeriesRecommendations,
  GetTopRatedTvSeries,
  GetWatchlistTvSeries,
  GetWatchListStatusTvSeries,
  SaveWatchlistTvSeries,
  RemoveWatchlistTvSeries,
], customMocks: [
  MockSpec<SslPinning>(as: #MockHttpClient)
])
void main() {}
