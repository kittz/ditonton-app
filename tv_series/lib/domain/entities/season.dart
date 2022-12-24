import 'package:tv_series/domain/entities/episode.dart';
import 'package:equatable/equatable.dart';

class Season extends Equatable {
  const Season({
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
  final List<Episode>? episodes;
  final int? episodeCount;
  final String? name;
  final String? overview;
  final int? id;
  final String? posterPath;
  final int? seasonNumber;

  @override
  List<Object?> get props => [
        sId,
        airDate,
        episodes,
        episodeCount,
        name,
        overview,
        id,
        posterPath,
        seasonNumber,
      ];
}
