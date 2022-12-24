import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TopRatedMoviesBloc topRatedMoviesBloc;
  late MockGetTopRatedMovies mockGetTopRatedMovies;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    topRatedMoviesBloc = TopRatedMoviesBloc(mockGetTopRatedMovies);
  });

  group('Top Rated movies with bloc: ', () {
    test('TopRatedMoviesBloc initial state should be empty ', () {
      expect(topRatedMoviesBloc.state, TopRatedMoviesEmpty());
    });
    blocTest<TopRatedMoviesBloc, MoviesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetTopRatedMovies.execute())
              .thenAnswer((_) async => Right(testMovieList));
          return topRatedMoviesBloc;
        },
        act: (bloc) => bloc.add(const TopRatedMovies()),
        expect: () => <MoviesState>[
              TopRatedMoviesLoading(),
              TopRatedMoviesHasData(testMovieList),
            ],
        verify: (bloc) {
          verify(mockGetTopRatedMovies.execute());
          return const TopRatedMovies().props;
        });

    blocTest<TopRatedMoviesBloc, MoviesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetTopRatedMovies.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return topRatedMoviesBloc;
      },
      act: (bloc) => bloc.add(const TopRatedMovies()),
      expect: () => <MoviesState>[
        TopRatedMoviesLoading(),
        const TopRatedMoviesError('Server Failure'),
      ],
      verify: (bloc) => TopRatedMoviesLoading(),
    );
  });
}
