import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_tv_series.mocks.dart';

void main() {
  late TvSeriesDetailBloc tvSeriesDetailBloc;
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;

  const testId = 1;

  setUp(() {
    mockGetTvSeriesDetail = MockGetTvSeriesDetail();
    tvSeriesDetailBloc = TvSeriesDetailBloc(mockGetTvSeriesDetail);
  });

  group('TV series detail with bloc: ', () {
    test('TvSeriesDetailBloc initial state should be empty ', () {
      expect(tvSeriesDetailBloc.state, TvSeriesDetailEmpty());
    });
    blocTest<TvSeriesDetailBloc, TvSeriesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetTvSeriesDetail.execute(testId))
              .thenAnswer((_) async => const Right(testTvSeriesDetail));
          return tvSeriesDetailBloc;
        },
        act: (bloc) => bloc.add(const TvSeriesDetailEvent(testId)),
        expect: () => <TvSeriesState>[
              TvSeriesDetailLoading(),
              const TvSeriesDetailHasData(testTvSeriesDetail),
            ],
        verify: (bloc) {
          verify(mockGetTvSeriesDetail.execute(testId));
          return const TvSeriesDetailEvent(testId).props;
        });

    blocTest<TvSeriesDetailBloc, TvSeriesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetTvSeriesDetail.execute(testId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return tvSeriesDetailBloc;
      },
      act: (bloc) => bloc.add(const TvSeriesDetailEvent(testId)),
      expect: () => <TvSeriesState>[
        TvSeriesDetailLoading(),
        const TvSeriesDetailError('Server Failure'),
      ],
      verify: (bloc) => TvSeriesDetailLoading(),
    );
  });
}
