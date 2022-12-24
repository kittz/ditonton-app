import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MovieRecommendationsBloc movieRecommendationsBloc;
  late MockGetMovieRecommendations mockGetMovieRecommendations;

  const testId = 1;

  setUp(() {
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    movieRecommendationsBloc =
        MovieRecommendationsBloc(mockGetMovieRecommendations);
  });

  group('Movie Recommendations with bloc: ', () {
    test('MovieRecommendationsBloc initial state should be empty ', () {
      expect(movieRecommendationsBloc.state, MovieRecommendationsEmpty());
    });
    blocTest<MovieRecommendationsBloc, MoviesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetMovieRecommendations.execute(testId))
              .thenAnswer((_) async => Right(testMovieList));
          return movieRecommendationsBloc;
        },
        act: (bloc) => bloc.add(const MovieRecommendations(testId)),
        expect: () => <MoviesState>[
              MovieRecommendationsLoading(),
              MovieRecommendationsHasData(testMovieList),
            ],
        verify: (bloc) {
          verify(mockGetMovieRecommendations.execute(testId));
          return const MovieRecommendations(testId).props;
        });

    blocTest<MovieRecommendationsBloc, MoviesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetMovieRecommendations.execute(testId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return movieRecommendationsBloc;
      },
      act: (bloc) => bloc.add(const MovieRecommendations(testId)),
      expect: () => <MoviesState>[
        MovieRecommendationsLoading(),
        const MovieRecommendationsError('Server Failure'),
      ],
      verify: (bloc) => MovieRecommendationsLoading(),
    );
  });
}
