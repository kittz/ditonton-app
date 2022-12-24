import 'package:tv_series/data/models/episode_model.dart';
import 'package:tv_series/data/models/season_model.dart';
import 'package:tv_series/domain/entities/episode.dart';
import 'package:tv_series/domain/entities/season.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tSeasonModel = SeasonModel(
    sId: null,
    airDate: "airDate",
    episodes: <EpisodeModel>[],
    episodeCount: 1,
    name: "name",
    overview: "overview",
    id: 1,
    posterPath: "posterPath",
    seasonNumber: 1,
  );
  const tSeason = Season(
    sId: null,
    airDate: "airDate",
    episodes: <Episode>[],
    episodeCount: 1,
    name: "name",
    overview: "overview",
    id: 1,
    posterPath: "posterPath",
    seasonNumber: 1,
  );

  test('should be a subclass of Season entity', () async {
    final result = tSeasonModel.toEntity();
    expect(result, tSeason);
  });
}
