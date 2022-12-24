import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv_series.mocks.dart';

void main() {
  late PopularTvSeriesBloc popularTvSeriesBloc;
  late MockGetPopularTvSeries mockGetPopularTvSeries;

  setUp(() {
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    popularTvSeriesBloc = PopularTvSeriesBloc(mockGetPopularTvSeries);
  });

  group('Popular TV series with bloc: ', () {
    test('PopularTvSeriesBloc initial state should be empty ', () {
      expect(popularTvSeriesBloc.state, PopularTvSeriesEmpty());
    });
    blocTest<PopularTvSeriesBloc, TvSeriesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetPopularTvSeries.execute())
              .thenAnswer((_) async => Right(testTvSeriesList));
          return popularTvSeriesBloc;
        },
        act: (bloc) => bloc.add(const PopularTvSeries()),
        expect: () => <TvSeriesState>[
              PopularTvSeriesLoading(),
              PopularTvSeriesHasData(testTvSeriesList),
            ],
        verify: (bloc) {
          verify(mockGetPopularTvSeries.execute());
          return const PopularTvSeries().props;
        });

    blocTest<PopularTvSeriesBloc, TvSeriesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetPopularTvSeries.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return popularTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const PopularTvSeries()),
      expect: () => <TvSeriesState>[
        PopularTvSeriesLoading(),
        const PopularTvSeriesError('Server Failure'),
      ],
      verify: (bloc) => PopularTvSeriesLoading(),
    );
  });
}
