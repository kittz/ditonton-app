import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:search/domain/usecases/search_tv_series.dart';
import 'package:search/presentation/provider/tv_series_search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_series_search_notifier_test.mocks.dart';

@GenerateMocks([SearchTvSeries])
void main() {
  late TvSeriesSearchNotifier provider;
  late MockSearchTvSeries mockSearchTvSeries;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockSearchTvSeries = MockSearchTvSeries();
    provider = TvSeriesSearchNotifier(searchTvSeries: mockSearchTvSeries)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

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
  const tQuery = 'spiderman';

  group('search tv series', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => Right(tTvSeriesList));
      // act
      provider.fetchTvSeriesSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => Right(tTvSeriesList));
      // act
      await provider.fetchTvSeriesSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.searchResult, tTvSeriesList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTvSeriesSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
