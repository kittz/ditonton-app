import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv_series.mocks.dart';

void main() {
  late WatchlistTvSeriesBloc watchlistTvSeriesBloc;
  late MockGetWatchlistTvSeries mockGetWatchlistTvSeries;
  late MockGetWatchListStatusTvSeries mockGetWatchListStatusTvSeries;
  late MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries;
  late MockRemoveWatchlistTvSeries mockRemoveWatchlistTvSeries;

  setUp(() {
    mockGetWatchlistTvSeries = MockGetWatchlistTvSeries();
    mockGetWatchListStatusTvSeries = MockGetWatchListStatusTvSeries();
    mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();
    mockRemoveWatchlistTvSeries = MockRemoveWatchlistTvSeries();
    watchlistTvSeriesBloc = WatchlistTvSeriesBloc(
      getWatchlistTvSeries: mockGetWatchlistTvSeries,
      getWatchListStatusTvSeries: mockGetWatchListStatusTvSeries,
      removeWatchlistTvSeries: mockRemoveWatchlistTvSeries,
      saveWatchlistTvSeries: mockSaveWatchlistTvSeries,
    );
  });

  test('WatchlistTvSeriesBloc initial state should be empty ', () {
    expect(watchlistTvSeriesBloc.state, WatchlistTvSeriesEmpty());
  });

  group('WatchlistTvSeries Event (get watchlist): ', () {
    blocTest<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
      'should emits [Loading, HasData] when data is gotten successfull',
      build: () {
        when(mockGetWatchlistTvSeries.execute())
            .thenAnswer((_) async => Right([testWatchlistTvSeries]));
        return watchlistTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const WatchlistTvSeries()),
      expect: () => [
        WatchlistTvSeriesLoading(),
        WatchlistTvSeriesHasData([testWatchlistTvSeries]),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTvSeries.execute());
        return const WatchlistTvSeries().props;
      },
    );

    blocTest<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
      'should emits [Loading, Error] when watchlist TV series list data is failed to fetch',
      build: () {
        when(mockGetWatchlistTvSeries.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return watchlistTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const WatchlistTvSeries()),
      expect: () => <WatchlistTvSeriesState>[
        WatchlistTvSeriesLoading(),
        const WatchlistTvSeriesError('Server Failure'),
      ],
      verify: (bloc) => WatchlistTvSeriesLoading(),
    );
  });

  group('WatchlistTvSeriesStatus Event: ', () {
    blocTest<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
      'should be return true when TV series exists in watchlist database',
      build: () {
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => true);
        return watchlistTvSeriesBloc;
      },
      act: (bloc) => bloc.add(WatchlistTvSeriesStatus(testTvSeriesDetail.id)),
      expect: () => [
        WatchlistTvSeriesLoading(),
        const WatchlistTvSeriesStatusState(true)
      ],
      verify: (bloc) {
        verify(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id));
        return WatchlistTvSeriesStatus(testTvSeriesDetail.id).props;
      },
    );

    blocTest<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
        'should be return false when TV series doesn\'t exists in watchlist database',
        build: () {
          when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id))
              .thenAnswer((_) async => false);
          return watchlistTvSeriesBloc;
        },
        act: (bloc) => bloc.add(WatchlistTvSeriesStatus(testTvSeriesDetail.id)),
        expect: () => <WatchlistTvSeriesState>[
              WatchlistTvSeriesLoading(),
              const WatchlistTvSeriesStatusState(false),
            ],
        verify: (bloc) {
          verify(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id));
          return WatchlistTvSeriesStatus(testTvSeriesDetail.id).props;
        });
  });

  group('SaveWatchlistTvSeries: ', () {
    blocTest<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
      'watchlist status should change when TV series succesfully added to watchlist',
      build: () {
        when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        return watchlistTvSeriesBloc;
      },
      act: (bloc) =>
          bloc.add(const SaveWatchlistTvSeriesEvent(testTvSeriesDetail)),
      expect: () => [
        const WatchlistTvSeriesMessageState('Added to Watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail));
        return const SaveWatchlistTvSeriesEvent(testTvSeriesDetail).props;
      },
    );

    blocTest<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
      'should throw DB failure message when TV series can\'t be added to watchlist',
      build: () {
        when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail)).thenAnswer(
            (_) async =>
                const Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistTvSeriesBloc;
      },
      act: (bloc) =>
          bloc.add(const SaveWatchlistTvSeriesEvent(testTvSeriesDetail)),
      expect: () => [
        const WatchlistTvSeriesError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail));
        return const SaveWatchlistTvSeriesEvent(testTvSeriesDetail).props;
      },
    );
  });

  group('RemoveWatchlistTvSeries: ', () {
    blocTest<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
      'watchlist status should change when TV series succesfully removed from watchlist',
      build: () {
        when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail))
            .thenAnswer((_) async => const Right('Removed from Watchlist'));
        return watchlistTvSeriesBloc;
      },
      act: (bloc) =>
          bloc.add(const RemoveWatchlistTvSeriesEvent(testTvSeriesDetail)),
      expect: () => [
        const WatchlistTvSeriesMessageState('Removed from Watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail));
        return const RemoveWatchlistTvSeriesEvent(testTvSeriesDetail).props;
      },
    );

    blocTest<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
      'should throw DB failure message when TV series can\'t be removed from watchlist',
      build: () {
        when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail))
            .thenAnswer((_) async =>
                const Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistTvSeriesBloc;
      },
      act: (bloc) =>
          bloc.add(const RemoveWatchlistTvSeriesEvent(testTvSeriesDetail)),
      expect: () => [
        const WatchlistTvSeriesError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail));
        return const RemoveWatchlistTvSeriesEvent(testTvSeriesDetail).props;
      },
    );
  });
}
