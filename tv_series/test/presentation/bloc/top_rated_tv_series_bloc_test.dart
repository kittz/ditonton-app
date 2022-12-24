import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv_series.mocks.dart';

void main() {
  late TopRatedTvSeriesBloc topRatedTvSeriesBloc;
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;

  setUp(() {
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    topRatedTvSeriesBloc = TopRatedTvSeriesBloc(mockGetTopRatedTvSeries);
  });

  group('Top Rated TV series with bloc: ', () {
    test('TopRatedTvSeriesBloc initial state should be empty ', () {
      expect(topRatedTvSeriesBloc.state, TopRatedTvSeriesEmpty());
    });
    blocTest<TopRatedTvSeriesBloc, TvSeriesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetTopRatedTvSeries.execute())
              .thenAnswer((_) async => Right(testTvSeriesList));
          return topRatedTvSeriesBloc;
        },
        act: (bloc) => bloc.add(const TopRatedTvSeries()),
        expect: () => <TvSeriesState>[
              TopRatedTvSeriesLoading(),
              TopRatedTvSeriesHasData(testTvSeriesList),
            ],
        verify: (bloc) {
          verify(mockGetTopRatedTvSeries.execute());
          return const TopRatedTvSeries().props;
        });

    blocTest<TopRatedTvSeriesBloc, TvSeriesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetTopRatedTvSeries.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return topRatedTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const TopRatedTvSeries()),
      expect: () => <TvSeriesState>[
        TopRatedTvSeriesLoading(),
        const TopRatedTvSeriesError('Server Failure'),
      ],
      verify: (bloc) => TopRatedTvSeriesLoading(),
    );
  });
}
