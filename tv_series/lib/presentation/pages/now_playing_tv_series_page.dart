// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:flutter/material.dart';

class NowPlayingTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/now-playing-tvseries';

  const NowPlayingTvSeriesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NowPlayingTvSeriesPageState createState() => _NowPlayingTvSeriesPageState();
}

class _NowPlayingTvSeriesPageState extends State<NowPlayingTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<NowPlayingTvSeriesBloc>().add(
            const NowPlayingTvSeries(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing (TV Series)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NowPlayingTvSeriesBloc, TvSeriesState>(
          builder: (context, state) {
            if (state is NowPlayingTvSeriesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NowPlayingTvSeriesHasData) {
              final result = state.result;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSeries = result[index];
                  return TvSeriesCard(tvSeries);
                },
                itemCount: result.length,
              );
            } else {
              return const Center(
                key: Key('error_message'),
                child: Text('Failed'),
              );
            }
          },
        ),
      ),
    );
  }
}
