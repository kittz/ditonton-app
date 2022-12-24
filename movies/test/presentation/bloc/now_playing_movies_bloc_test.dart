import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late NowPlayingMoviesBloc nowPlayingMoviesBloc;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    nowPlayingMoviesBloc = NowPlayingMoviesBloc(mockGetNowPlayingMovies);
  });

  group('Now playing movies with bloc: ', () {
    test('NowPlayingMoviesBloc initial state should be empty', () {
      expect(nowPlayingMoviesBloc.state, NowPlayingMoviesEmpty());
    });
    blocTest<NowPlayingMoviesBloc, MoviesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetNowPlayingMovies.execute())
              .thenAnswer((_) async => Right(testMovieList));
          return nowPlayingMoviesBloc;
        },
        act: (bloc) => bloc.add(const NowPlayingMovies()),
        expect: () => <MoviesState>[
              NowPlayingMoviesLoading(),
              NowPlayingMoviesHasData(testMovieList),
            ],
        verify: (bloc) {
          verify(mockGetNowPlayingMovies.execute());
          return const NowPlayingMovies().props;
        });

    blocTest<NowPlayingMoviesBloc, MoviesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetNowPlayingMovies.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return nowPlayingMoviesBloc;
      },
      act: (bloc) => bloc.add(const NowPlayingMovies()),
      expect: () => <MoviesState>[
        NowPlayingMoviesLoading(),
        const NowPlayingMoviesError('Server Failure'),
      ],
      verify: (bloc) => NowPlayingMoviesLoading(),
    );
  });
}
