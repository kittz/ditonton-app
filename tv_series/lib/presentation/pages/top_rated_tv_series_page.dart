// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:flutter/material.dart';

class TopRatedTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tvseries';

  const TopRatedTvSeriesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TopRatedTvSeriesPageState createState() => _TopRatedTvSeriesPageState();
}

class _TopRatedTvSeriesPageState extends State<TopRatedTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<TopRatedTvSeriesBloc>().add(
            const TopRatedTvSeries(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TopRated (TV Series)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedTvSeriesBloc, TvSeriesState>(
          builder: (context, state) {
            if (state is TopRatedTvSeriesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedTvSeriesHasData) {
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
