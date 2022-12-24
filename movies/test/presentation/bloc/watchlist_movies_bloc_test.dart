import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late WatchlistMoviesBloc watchlistMoviesBloc;
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late MockGetWatchListStatus mockGetWatchListStatusMovies;
  late MockSaveWatchlist mockSaveWatchlistMovies;
  late MockRemoveWatchlist mockRemoveWatchlistMovies;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    mockGetWatchListStatusMovies = MockGetWatchListStatus();
    mockSaveWatchlistMovies = MockSaveWatchlist();
    mockRemoveWatchlistMovies = MockRemoveWatchlist();
    watchlistMoviesBloc = WatchlistMoviesBloc(
      getWatchlistMovies: mockGetWatchlistMovies,
      getWatchListStatusMovies: mockGetWatchListStatusMovies,
      removeWatchlistMovies: mockRemoveWatchlistMovies,
      saveWatchlistMovies: mockSaveWatchlistMovies,
    );
  });

  test('WatchlistMoviesBloc initial state should be empty ', () {
    expect(watchlistMoviesBloc.state, WatchlistMoviesEmpty());
  });

  group('WatchlistMovies Event (get watchlist): ', () {
    blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
      'should emits [Loading, HasData] when data is gotten successfull',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Right([testWatchlistMovie]));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(const WatchlistMovies()),
      expect: () => [
        WatchlistMoviesLoading(),
        WatchlistMoviesHasData([testWatchlistMovie]),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
        return const WatchlistMovies().props;
      },
    );

    blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
      'should emits [Loading, Error] when watchlist movie list data is failed to fetch',
      build: () {
        when(mockGetWatchlistMovies.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(const WatchlistMovies()),
      expect: () => <WatchlistMoviesState>[
        WatchlistMoviesLoading(),
        const WatchlistMoviesError('Server Failure'),
      ],
      verify: (bloc) => WatchlistMoviesLoading(),
    );
  });

  group('WatchlistMoviesStatus Event: ', () {
    blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
      'should be return true when movie exists in watchlist database',
      build: () {
        when(mockGetWatchListStatusMovies.execute(testMovieDetail.id))
            .thenAnswer((_) async => true);
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(WatchlistMoviesStatus(testMovieDetail.id)),
      expect: () =>
          [WatchlistMoviesLoading(), const WatchlistMoviesStatusState(true)],
      verify: (bloc) {
        verify(mockGetWatchListStatusMovies.execute(testMovieDetail.id));
        return WatchlistMoviesStatus(testMovieDetail.id).props;
      },
    );

    blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
        'should be return false when movie doesn\'t exists in watchlist database',
        build: () {
          when(mockGetWatchListStatusMovies.execute(testMovieDetail.id))
              .thenAnswer((_) async => false);
          return watchlistMoviesBloc;
        },
        act: (bloc) => bloc.add(WatchlistMoviesStatus(testMovieDetail.id)),
        expect: () => <WatchlistMoviesState>[
              WatchlistMoviesLoading(),
              const WatchlistMoviesStatusState(false),
            ],
        verify: (bloc) {
          verify(mockGetWatchListStatusMovies.execute(testMovieDetail.id));
          return WatchlistMoviesStatus(testMovieDetail.id).props;
        });
  });

  group('SaveWatchlistMovies: ', () {
    blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
      'watchlist status should change when movie succesfully added to watchlist',
      build: () {
        when(mockSaveWatchlistMovies.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(const SaveWatchlistMovies(testMovieDetail)),
      expect: () => [
        const WatchlistMoviesMessageState('Added to Watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlistMovies.execute(testMovieDetail));
        return const SaveWatchlistMovies(testMovieDetail).props;
      },
    );

    blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
      'should throw DB failure message when movie can\'t be added to watchlist',
      build: () {
        when(mockSaveWatchlistMovies.execute(testMovieDetail)).thenAnswer(
            (_) async =>
                const Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(const SaveWatchlistMovies(testMovieDetail)),
      expect: () => [
        const WatchlistMoviesError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlistMovies.execute(testMovieDetail));
        return const SaveWatchlistMovies(testMovieDetail).props;
      },
    );
  });

  group('RemoveWatchlistMovies: ', () {
    blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
      'watchlist status should change when movie succesfully removed from watchlist',
      build: () {
        when(mockRemoveWatchlistMovies.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Removed from Watchlist'));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(const RemoveWatchlistMovies(testMovieDetail)),
      expect: () => [
        const WatchlistMoviesMessageState('Removed from Watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlistMovies.execute(testMovieDetail));
        return const RemoveWatchlistMovies(testMovieDetail).props;
      },
    );

    blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
      'should throw DB failure message when movie can\'t be removed from watchlist',
      build: () {
        when(mockRemoveWatchlistMovies.execute(testMovieDetail)).thenAnswer(
            (_) async =>
                const Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(const RemoveWatchlistMovies(testMovieDetail)),
      expect: () => [
        const WatchlistMoviesError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlistMovies.execute(testMovieDetail));
        return const RemoveWatchlistMovies(testMovieDetail).props;
      },
    );
  });
}
