import 'package:tv_series/data/models/genre_model.dart';
import 'package:tv_series/domain/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tGenreModel = GenreModel(
    id: 1,
    name: "name",
  );
  const tGenre = Genre(
    id: 1,
    name: "name",
  );

  test('should be a subclass of Genre entity', () async {
    final result = tGenreModel.toEntity();
    expect(result, tGenre);
  });
}
