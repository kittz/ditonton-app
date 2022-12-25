import 'package:core/data/datasources/db/database_helper.dart';
import 'package:mockito/annotations.dart';
import 'package:movies/movies.dart';
import 'package:core/core.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
  GetMovieDetail,
  GetNowPlayingMovies,
  GetPopularMovies,
  GetMovieRecommendations,
  GetTopRatedMovies,
  GetWatchlistMovies,
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
], customMocks: [
  // MockSpec<http.Client>(as: #MockHttpClient),
  MockSpec<SslPinning>(as: #MockHttpClient)
])
void main() {}
