import 'package:tv_series/data/models/episode_model.dart';
import 'package:tv_series/domain/entities/season.dart';
import 'package:equatable/equatable.dart';

class SeasonModel extends Equatable {
  const SeasonModel({
    required this.sId,
    required this.airDate,
    required this.episodes,
    required this.episodeCount,
    required this.name,
    required this.overview,
    required this.id,
    required this.posterPath,
    required this.seasonNumber,
  });

  final String? sId;
  final String? airDate;
  final List<EpisodeModel>? episodes;
  final int? episodeCount;
  final String? name;
  final String? overview;
  final int id;
  final String? posterPath;
  final int seasonNumber;

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        sId: json["_id"],
        airDate: json["air_date"],
        episodes: (json["episodes"] == null)
            ? null
            : List<EpisodeModel>.from(
                json["episodes"].map((x) => EpisodeModel.fromJson(x))),
        episodeCount: json["episode_count"],
        name: json["name"],
        overview: json["overview"],
        id: json["id"],
        posterPath: json["poster_path"],
        seasonNumber: json["season_number"],
      );

  Map<String, dynamic> toJson() => {
        "_id": sId,
        "air_date": airDate,
        "episodes": (episodes == null)
            ? null
            : List<dynamic>.from(episodes!.map((x) => x.toJson())),
        "name": name,
        "overview": overview,
        "id": id,
        "poster_path": posterPath,
        "season_number": seasonNumber,
      };

  Season toEntity() {
    return Season(
      sId: sId,
      airDate: airDate,
      episodes: (episodes == null)
          ? null
          : episodes!.map((episode) => episode.toEntity()).toList(),
      episodeCount: episodeCount,
      name: name,
      overview: overview,
      id: id,
      posterPath: posterPath,
      seasonNumber: seasonNumber,
    );
  }

  @override
  List<Object?> get props => [
        sId,
        airDate,
        episodes,
        name,
        overview,
        id,
        posterPath,
        seasonNumber,
      ];
}
