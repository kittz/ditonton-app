import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MovieDetailBloc movieDetailBloc;
  late MockGetMovieDetail mockGetMovieDetail;

  const testId = 1;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    movieDetailBloc = MovieDetailBloc(mockGetMovieDetail);
  });

  group('Movie detail with bloc: ', () {
    test('MovieDetailBloc initial state should be empty ', () {
      expect(movieDetailBloc.state, MovieDetailEmpty());
    });
    blocTest<MovieDetailBloc, MoviesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetMovieDetail.execute(testId))
              .thenAnswer((_) async => const Right(testMovieDetail));
          return movieDetailBloc;
        },
        act: (bloc) => bloc.add(const MovieDetailEvent(testId)),
        expect: () => <MoviesState>[
              MovieDetailLoading(),
              const MovieDetailHasData(testMovieDetail),
            ],
        verify: (bloc) {
          verify(mockGetMovieDetail.execute(testId));
          return const MovieDetailEvent(testId).props;
        });

    blocTest<MovieDetailBloc, MoviesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetMovieDetail.execute(testId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(const MovieDetailEvent(testId)),
      expect: () => <MoviesState>[
        MovieDetailLoading(),
        const MovieDetailError('Server Failure'),
      ],
      verify: (bloc) => MovieDetailLoading(),
    );
  });
}
