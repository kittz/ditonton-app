import 'package:movies/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  group("TV Series Card List Test", () {
    testWidgets("check if Widget had name and overview", (tester) async {
      await tester.pumpWidget(Builder(
        builder: ((context) => MaterialApp(
              home: Scaffold(body: MovieCard(testMovie)),
            )),
      ));
      final nameFinder = find.text("Spider-Man");
      final overviewFinder = find.text(
          "After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.");
      expect(nameFinder, findsOneWidget);
      expect(overviewFinder, findsOneWidget);
    });
  });
}
