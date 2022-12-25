// Mocks generated by Mockito 5.3.2 from annotations
// in tv_series/test/helpers/test_helper_tv_series.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i29;
import 'dart:io' as _i5;
import 'dart:typed_data' as _i30;

import 'package:core/core.dart' as _i28;
import 'package:core/data/datasources/db/database_helper.dart' as _i16;
import 'package:core/utils/failure.dart' as _i9;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i6;
import 'package:http/io_client.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies/data/models/movie_table.dart' as _i18;
import 'package:sqflite/sqflite.dart' as _i17;
import 'package:tv_series/data/datasources/tv_series_local_data_source.dart'
    as _i14;
import 'package:tv_series/data/datasources/tv_series_remote_data_source.dart'
    as _i12;
import 'package:tv_series/data/models/tv_series_detail_model.dart' as _i3;
import 'package:tv_series/data/models/tv_series_model.dart' as _i13;
import 'package:tv_series/data/models/tv_series_table.dart' as _i15;
import 'package:tv_series/domain/entities/tv_series.dart' as _i10;
import 'package:tv_series/domain/entities/tv_series_detail.dart' as _i11;
import 'package:tv_series/domain/repositories/tv_series_repository.dart' as _i4;
import 'package:tv_series/domain/usecases/get_now_playing_tv_series.dart'
    as _i20;
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart' as _i21;
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart' as _i23;
import 'package:tv_series/domain/usecases/get_tv_series_detail.dart' as _i19;
import 'package:tv_series/domain/usecases/get_tv_series_recommendations.dart'
    as _i22;
import 'package:tv_series/domain/usecases/get_watchlist_status_tv_series.dart'
    as _i25;
import 'package:tv_series/domain/usecases/get_watchlist_tv_series.dart' as _i24;
import 'package:tv_series/domain/usecases/remove_watchlist_tv_series.dart'
    as _i27;
import 'package:tv_series/domain/usecases/save_watchlist_tv_series.dart'
    as _i26;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesDetailResponse_1 extends _i1.SmartFake
    implements _i3.TvSeriesDetailResponse {
  _FakeTvSeriesDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesRepository_2 extends _i1.SmartFake
    implements _i4.TvSeriesRepository {
  _FakeTvSeriesRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSecurityContext_3 extends _i1.SmartFake
    implements _i5.SecurityContext {
  _FakeSecurityContext_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4 extends _i1.SmartFake implements _i6.Response {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOStreamedResponse_5 extends _i1.SmartFake
    implements _i7.IOStreamedResponse {
  _FakeIOStreamedResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRepository extends _i1.Mock
    implements _i4.TvSeriesRepository {
  MockTvSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>
      getNowPlayingTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getNowPlayingTvSeries,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.TvSeries>>(
              this,
              Invocation.method(
                #getNowPlayingTvSeries,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>
      getPopularTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getPopularTvSeries,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.TvSeries>>(
              this,
              Invocation.method(
                #getPopularTvSeries,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>
      getTopRatedTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedTvSeries,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.TvSeries>>(
              this,
              Invocation.method(
                #getTopRatedTvSeries,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i11.TvSeriesDetail>> getTvSeriesDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesDetail,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i11.TvSeriesDetail>>.value(
                _FakeEither_0<_i9.Failure, _i11.TvSeriesDetail>(
          this,
          Invocation.method(
            #getTvSeriesDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i11.TvSeriesDetail>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>
      getTvSeriesRecommendations(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getTvSeriesRecommendations,
              [id],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.TvSeries>>(
              this,
              Invocation.method(
                #getTvSeriesRecommendations,
                [id],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>> searchTvSeries(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSeries,
          [query],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.TvSeries>>(
          this,
          Invocation.method(
            #searchTvSeries,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> saveWatchlistTvSeries(
          _i11.TvSeriesDetail? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistTvSeries,
          [tvSeries],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistTvSeries,
            [tvSeries],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> removeWatchlistTvSeries(
          _i11.TvSeriesDetail? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTvSeries,
          [tvSeries],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlistTvSeries,
            [tvSeries],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<bool> isAddedToWatchlistTvSeries(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlistTvSeries,
          [id],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>
      getWatchlistTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getWatchlistTvSeries,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.TvSeries>>(
              this,
              Invocation.method(
                #getWatchlistTvSeries,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>);
}

/// A class which mocks [TvSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRemoteDataSource extends _i1.Mock
    implements _i12.TvSeriesRemoteDataSource {
  MockTvSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i13.TvSeriesModel>> getNowPlayingTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingTvSeries,
          [],
        ),
        returnValue:
            _i8.Future<List<_i13.TvSeriesModel>>.value(<_i13.TvSeriesModel>[]),
      ) as _i8.Future<List<_i13.TvSeriesModel>>);
  @override
  _i8.Future<List<_i13.TvSeriesModel>> getPopularTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvSeries,
          [],
        ),
        returnValue:
            _i8.Future<List<_i13.TvSeriesModel>>.value(<_i13.TvSeriesModel>[]),
      ) as _i8.Future<List<_i13.TvSeriesModel>>);
  @override
  _i8.Future<List<_i13.TvSeriesModel>> getTopRatedTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvSeries,
          [],
        ),
        returnValue:
            _i8.Future<List<_i13.TvSeriesModel>>.value(<_i13.TvSeriesModel>[]),
      ) as _i8.Future<List<_i13.TvSeriesModel>>);
  @override
  _i8.Future<_i3.TvSeriesDetailResponse> getTvSeriesDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesDetail,
          [id],
        ),
        returnValue: _i8.Future<_i3.TvSeriesDetailResponse>.value(
            _FakeTvSeriesDetailResponse_1(
          this,
          Invocation.method(
            #getTvSeriesDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i3.TvSeriesDetailResponse>);
  @override
  _i8.Future<List<_i13.TvSeriesModel>> getTvSeriesRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesRecommendations,
          [id],
        ),
        returnValue:
            _i8.Future<List<_i13.TvSeriesModel>>.value(<_i13.TvSeriesModel>[]),
      ) as _i8.Future<List<_i13.TvSeriesModel>>);
  @override
  _i8.Future<List<_i13.TvSeriesModel>> searchTvSeries(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSeries,
          [query],
        ),
        returnValue:
            _i8.Future<List<_i13.TvSeriesModel>>.value(<_i13.TvSeriesModel>[]),
      ) as _i8.Future<List<_i13.TvSeriesModel>>);
}

/// A class which mocks [TvSeriesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesLocalDataSource extends _i1.Mock
    implements _i14.TvSeriesLocalDataSource {
  MockTvSeriesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String> insertWatchlistTvSeries(_i15.TvSeriesTable? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTvSeries,
          [tvSeries],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> removeWatchlistTvSeries(_i15.TvSeriesTable? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTvSeries,
          [tvSeries],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i15.TvSeriesTable?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesById,
          [id],
        ),
        returnValue: _i8.Future<_i15.TvSeriesTable?>.value(),
      ) as _i8.Future<_i15.TvSeriesTable?>);
  @override
  _i8.Future<List<_i15.TvSeriesTable>> getWatchlistTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvSeries,
          [],
        ),
        returnValue:
            _i8.Future<List<_i15.TvSeriesTable>>.value(<_i15.TvSeriesTable>[]),
      ) as _i8.Future<List<_i15.TvSeriesTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i16.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i17.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i8.Future<_i17.Database?>.value(),
      ) as _i8.Future<_i17.Database?>);
  @override
  _i8.Future<int> insertWatchlist(_i18.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [movie],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<int> insertWatchlistTvSeries(_i15.TvSeriesTable? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTvSeries,
          [tvSeries],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<int> removeWatchlist(_i18.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<int> removeWatchlistTvSeries(_i15.TvSeriesTable? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTvSeries,
          [tvSeries],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i8.Future<Map<String, dynamic>?>.value(),
      ) as _i8.Future<Map<String, dynamic>?>);
  @override
  _i8.Future<Map<String, dynamic>?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesById,
          [id],
        ),
        returnValue: _i8.Future<Map<String, dynamic>?>.value(),
      ) as _i8.Future<Map<String, dynamic>?>);
  @override
  _i8.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i8.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i8.Future<List<Map<String, dynamic>>>);
  @override
  _i8.Future<List<Map<String, dynamic>>> getWatchlistTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvSeries,
          [],
        ),
        returnValue: _i8.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i8.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [GetTvSeriesDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvSeriesDetail extends _i1.Mock implements _i19.GetTvSeriesDetail {
  MockGetTvSeriesDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i11.TvSeriesDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i11.TvSeriesDetail>>.value(
                _FakeEither_0<_i9.Failure, _i11.TvSeriesDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i11.TvSeriesDetail>>);
}

/// A class which mocks [GetNowPlayingTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetNowPlayingTvSeries extends _i1.Mock
    implements _i20.GetNowPlayingTvSeries {
  MockGetNowPlayingTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.TvSeries>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>);
}

/// A class which mocks [GetPopularTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularTvSeries extends _i1.Mock
    implements _i21.GetPopularTvSeries {
  MockGetPopularTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.TvSeries>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>);
}

/// A class which mocks [GetTvSeriesRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvSeriesRecommendations extends _i1.Mock
    implements _i22.GetTvSeriesRecommendations {
  MockGetTvSeriesRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>> execute(
          dynamic id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.TvSeries>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>);
}

/// A class which mocks [GetTopRatedTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedTvSeries extends _i1.Mock
    implements _i23.GetTopRatedTvSeries {
  MockGetTopRatedTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.TvSeries>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>);
}

/// A class which mocks [GetWatchlistTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTvSeries extends _i1.Mock
    implements _i24.GetWatchlistTvSeries {
  MockGetWatchlistTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.TvSeries>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.TvSeries>>>);
}

/// A class which mocks [GetWatchListStatusTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListStatusTvSeries extends _i1.Mock
    implements _i25.GetWatchListStatusTvSeries {
  MockGetWatchListStatusTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i8.Future<bool> execute(int? id) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
}

/// A class which mocks [SaveWatchlistTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlistTvSeries extends _i1.Mock
    implements _i26.SaveWatchlistTvSeries {
  MockSaveWatchlistTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> execute(
          _i11.TvSeriesDetail? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tvSeries],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tvSeries],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
}

/// A class which mocks [RemoveWatchlistTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlistTvSeries extends _i1.Mock
    implements _i27.RemoveWatchlistTvSeries {
  MockRemoveWatchlistTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> execute(
          _i11.TvSeriesDetail? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tvSeries],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tvSeries],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
}

/// A class which mocks [SslPinning].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i28.SslPinning {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.SecurityContext> get globalContext => (super.noSuchMethod(
        Invocation.getter(#globalContext),
        returnValue:
            _i8.Future<_i5.SecurityContext>.value(_FakeSecurityContext_3(
          this,
          Invocation.getter(#globalContext),
        )),
      ) as _i8.Future<_i5.SecurityContext>);
  @override
  _i8.Future<_i6.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i7.IOStreamedResponse> send(_i6.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i7.IOStreamedResponse>.value(_FakeIOStreamedResponse_5(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i7.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i6.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i29.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i29.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i29.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i29.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i30.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i30.Uint8List>.value(_i30.Uint8List(0)),
      ) as _i8.Future<_i30.Uint8List>);
}
