import 'package:core/data/datasources/db/database_helper.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:movies/movies.dart';

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
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
