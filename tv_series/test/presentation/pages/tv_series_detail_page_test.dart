import 'package:core/utils/state_enum.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/presentation/pages/tv_series_detail_page.dart';
import 'package:tv_series/presentation/provider/tv_series_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_page_test.mocks.dart';

@GenerateMocks([TvSeriesDetailNotifier])
void main() {
  late MockTvSeriesDetailNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockTvSeriesDetailNotifier();
  });

  // ignore: no_leading_underscores_for_local_identifiers
  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesDetailNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when tv series not added to watchlist',
      (WidgetTester tester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeriesRecommendations).thenReturn(<TvSeries>[]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester
        .pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when tv series is added to watchlist',
      (WidgetTester tester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeriesRecommendations).thenReturn(<TvSeries>[]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(true);

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester
        .pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeriesRecommendations).thenReturn(<TvSeries>[]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockNotifier.watchlistMessage).thenReturn('Added to Watchlist');

    final watchlistButton = find.byType(ElevatedButton);

    await tester
        .pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeriesRecommendations).thenReturn(<TvSeries>[]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockNotifier.watchlistMessage).thenReturn('Failed');

    final watchlistButton = find.byType(ElevatedButton);

    await tester
        .pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
  testWidgets(
      '"Next Episode To Air" section will not be shown when there is no new episode',
      (WidgetTester tester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeriesRecommendations).thenReturn(<TvSeries>[]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockNotifier.watchlistMessage).thenReturn('Added to Watchlist');

    await tester
        .pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    final nextEpisodeToAirFinder = find.text("Next Episode");

    expect(nextEpisodeToAirFinder, findsNothing);
  });
  testWidgets(
      '"Next Episode To Air" section will be shown when there is new episode',
      (WidgetTester tester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetailWithNextEpisode);
    when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeriesRecommendations).thenReturn(<TvSeries>[]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockNotifier.watchlistMessage).thenReturn('Added to Watchlist');

    await tester
        .pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    final nextEpisodeToAirFinder = find.text("Next Episode");

    expect(nextEpisodeToAirFinder, findsOneWidget);
  });
  testWidgets(
      'Find Circular Progress Indicator when tv series state is loading',
      (WidgetTester tester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.Loading);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetailWithNextEpisode);
    when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvSeriesRecommendations).thenReturn(<TvSeries>[]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockNotifier.watchlistMessage).thenReturn('Added to Watchlist');

    await tester
        .pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    final circularProgressIndicator = find.byType(CircularProgressIndicator);

    expect(circularProgressIndicator, findsOneWidget);
  });
}
