import 'package:core/data/datasources/db/database_helper.dart';
import 'package:tv_series/tv_series.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

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
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
