import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv_series.mocks.dart';

void main() {
  late TvSeriesRecommendationsBloc movieRecommendationsBloc;
  late MockGetTvSeriesRecommendations mockGetTvSeriesRecommendations;

  const testId = 1;

  setUp(() {
    mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendations();
    movieRecommendationsBloc =
        TvSeriesRecommendationsBloc(mockGetTvSeriesRecommendations);
  });

  group('TV Series Recommendations with bloc: ', () {
    test('TvSeriesRecommendationsBloc initial state should be empty ', () {
      expect(movieRecommendationsBloc.state, TvSeriesRecommendationsEmpty());
    });
    blocTest<TvSeriesRecommendationsBloc, TvSeriesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetTvSeriesRecommendations.execute(testId))
              .thenAnswer((_) async => Right(testTvSeriesList));
          return movieRecommendationsBloc;
        },
        act: (bloc) => bloc.add(const TvSeriesRecommendations(testId)),
        expect: () => <TvSeriesState>[
              TvSeriesRecommendationsLoading(),
              TvSeriesRecommendationsHasData(testTvSeriesList),
            ],
        verify: (bloc) {
          verify(mockGetTvSeriesRecommendations.execute(testId));
          return const TvSeriesRecommendations(testId).props;
        });

    blocTest<TvSeriesRecommendationsBloc, TvSeriesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetTvSeriesRecommendations.execute(testId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return movieRecommendationsBloc;
      },
      act: (bloc) => bloc.add(const TvSeriesRecommendations(testId)),
      expect: () => <TvSeriesState>[
        TvSeriesRecommendationsLoading(),
        const TvSeriesRecommendationsError('Server Failure'),
      ],
      verify: (bloc) => TvSeriesRecommendationsLoading(),
    );
  });
}
