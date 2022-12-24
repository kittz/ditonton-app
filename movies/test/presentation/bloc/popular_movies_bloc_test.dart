import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late PopularMoviesBloc popularMoviesBloc;
  late MockGetPopularMovies mockGetPopularMovies;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    popularMoviesBloc = PopularMoviesBloc(mockGetPopularMovies);
  });

  group('Popular movies with bloc: ', () {
    test('PopularMoviesBloc initial state should be empty ', () {
      expect(popularMoviesBloc.state, PopularMoviesEmpty());
    });
    blocTest<PopularMoviesBloc, MoviesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetPopularMovies.execute())
              .thenAnswer((_) async => Right(testMovieList));
          return popularMoviesBloc;
        },
        act: (bloc) => bloc.add(const PopularMovies()),
        expect: () => <MoviesState>[
              PopularMoviesLoading(),
              PopularMoviesHasData(testMovieList),
            ],
        verify: (bloc) {
          verify(mockGetPopularMovies.execute());
          return const PopularMovies().props;
        });

    blocTest<PopularMoviesBloc, MoviesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetPopularMovies.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return popularMoviesBloc;
      },
      act: (bloc) => bloc.add(const PopularMovies()),
      expect: () => <MoviesState>[
        PopularMoviesLoading(),
        const PopularMoviesError('Server Failure'),
      ],
      verify: (bloc) => PopularMoviesLoading(),
    );
  });
}
