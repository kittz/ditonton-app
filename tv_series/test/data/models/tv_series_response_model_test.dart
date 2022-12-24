import 'dart:convert';

import 'package:tv_series/data/models/tv_series_model.dart';
import 'package:tv_series/data/models/tv_series_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  const tTvSeriesModel = TvSeriesModel(
      backdropPath: "/zMH3dAHXrP2ne7yLBLwL1hff3jn.jpg",
      firstAirDate: "2022-08-01",
      genreIds: [10751, 35, 10767],
      id: 206112,
      name: "Mapi",
      originCountry: ["ES"],
      originalLanguage: "es",
      originalName: "Mapi",
      overview: "",
      popularity: 1360.775,
      posterPath: "/pghBfllgjFrJvRAXcOSSYg0mYDJ.jpg",
      voteAverage: 7.3,
      voteCount: 3);
  const tTvSeriesResponseModel =
      TvSeriesResponse(tvSeriesList: <TvSeriesModel>[tTvSeriesModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/now_playing_tv_series.json'));
      // act
      final result = TvSeriesResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvSeriesResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvSeriesResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/zMH3dAHXrP2ne7yLBLwL1hff3jn.jpg",
            "first_air_date": "2022-08-01",
            "genre_ids": [10751, 35, 10767],
            "id": 206112,
            "name": "Mapi",
            "origin_country": ["ES"],
            "original_language": "es",
            "original_name": "Mapi",
            "overview": "",
            "popularity": 1360.775,
            "poster_path": "/pghBfllgjFrJvRAXcOSSYg0mYDJ.jpg",
            "vote_average": 7.3,
            "vote_count": 3
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
