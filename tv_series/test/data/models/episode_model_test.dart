import 'package:tv_series/data/models/episode_model.dart';
import 'package:tv_series/domain/entities/episode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tEpisodeModel = EpisodeModel(
    airDate: "airDate",
    episodeNumber: 1,
    id: 1,
    name: "name",
    overview: "overview",
    productionCode: "productionCode",
    runtime: 60,
    seasonNumber: 1,
    showId: 1,
    stillPath: "stillPath",
    voteAverage: 1,
    voteCount: 1,
  );

  const tEpisode = Episode(
    airDate: "airDate",
    episodeNumber: 1,
    id: 1,
    name: "name",
    overview: "overview",
    productionCode: "productionCode",
    runtime: 60,
    seasonNumber: 1,
    showId: 1,
    stillPath: "stillPath",
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of Episode entity', () async {
    final result = tEpisodeModel.toEntity();
    expect(result, tEpisode);
  });
}
