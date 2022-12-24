import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv_series.mocks.dart';

void main() {
  late NowPlayingTvSeriesBloc nowPlayingTvSeriesBloc;
  late MockGetNowPlayingTvSeries mockGetNowPlayingTvSeries;

  setUp(() {
    mockGetNowPlayingTvSeries = MockGetNowPlayingTvSeries();
    nowPlayingTvSeriesBloc = NowPlayingTvSeriesBloc(mockGetNowPlayingTvSeries);
  });

  group('Now playing tv series with bloc: ', () {
    test('NowPlayingTvSeriesBloc initial state should be empty', () {
      expect(nowPlayingTvSeriesBloc.state, NowPlayingTvSeriesEmpty());
    });
    blocTest<NowPlayingTvSeriesBloc, TvSeriesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetNowPlayingTvSeries.execute())
              .thenAnswer((_) async => Right(testTvSeriesList));
          return nowPlayingTvSeriesBloc;
        },
        act: (bloc) => bloc.add(const NowPlayingTvSeries()),
        expect: () => <TvSeriesState>[
              NowPlayingTvSeriesLoading(),
              NowPlayingTvSeriesHasData(testTvSeriesList),
            ],
        verify: (bloc) {
          verify(mockGetNowPlayingTvSeries.execute());
          return const NowPlayingTvSeries().props;
        });

    blocTest<NowPlayingTvSeriesBloc, TvSeriesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetNowPlayingTvSeries.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return nowPlayingTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const NowPlayingTvSeries()),
      expect: () => <TvSeriesState>[
        NowPlayingTvSeriesLoading(),
        const NowPlayingTvSeriesError('Server Failure'),
      ],
      verify: (bloc) => NowPlayingTvSeriesLoading(),
    );
  });
}
