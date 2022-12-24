import 'package:tv_series/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  group("TV Series Card List Test", () {
    testWidgets("check if Widget had name and overview", (tester) async {
      await tester.pumpWidget(Builder(
        builder: ((context) => MaterialApp(
              home: Scaffold(body: TvSeriesCard(testTvSeries)),
            )),
      ));
      final nameFinder = find.text("Game of Thrones");
      final overviewFinder =
          find.text("Seven noble families fig…and icy horrors beyond.");
      expect(nameFinder, findsOneWidget);
      expect(overviewFinder, findsOneWidget);
    });
  });
}
