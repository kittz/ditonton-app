import 'package:core/core.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usecases/search_tv_series.dart';
import 'package:search/presentation/bloc/search_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

import 'search_tv_series_bloc_test.mocks.dart';

@GenerateMocks([SearchTvSeries])
void main() {
  late SearchTvSeriesBloc searchTvSeriesBloc;
  late MockSearchTvSeries mockSearchTvSeries;
  final tTvSeriesModel = TvSeries(
    backdropPath: "/suopoADq0k8YZr4dQXcU6pToj6s.jpg",
    firstAirDate: "2011-04-17",
    genreIds: const [10765, 18, 10759],
    id: 1399,
    name: "Game of Thrones",
    originCountry: const ["US"],
    originalLanguage: "en",
    originalName: "Game of Thrones",
    overview: "Seven noble families fig…and icy horrors beyond.",
    popularity: 590.57,
    posterPath: "/7WUHnWGx5OO145IRxPDUkQSh4C7.jpg",
    voteAverage: 8.43,
    voteCount: 19849,
  );
  final tTvSeriesList = <TvSeries>[tTvSeriesModel];
  const tQuery = 'game of thrones';

  setUp(() {
    mockSearchTvSeries = MockSearchTvSeries();
    searchTvSeriesBloc = SearchTvSeriesBloc(mockSearchTvSeries);
  });

  group('Search tv series with bloc', () {
    test('initial state should be empty', () {
      expect(searchTvSeriesBloc.state, SearchEmpty());
    });

    blocTest<SearchTvSeriesBloc, SearchState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockSearchTvSeries.execute(tQuery))
            .thenAnswer((_) async => Right(tTvSeriesList));
        return searchTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const OnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        SearchTvSeriesHasData(tTvSeriesList),
      ],
      verify: (bloc) {
        verify(mockSearchTvSeries.execute(tQuery));
      },
    );

    blocTest<SearchTvSeriesBloc, SearchState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockSearchTvSeries.execute(tQuery)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return searchTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const OnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        const SearchError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockSearchTvSeries.execute(tQuery));
      },
    );
  });
}
