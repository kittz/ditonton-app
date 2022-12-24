// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:flutter/material.dart';

class PopularTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tvseries';

  const PopularTvSeriesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PopularTvSeriesPageState createState() => _PopularTvSeriesPageState();
}

class _PopularTvSeriesPageState extends State<PopularTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<PopularTvSeriesBloc>().add(
            const PopularTvSeries(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular (TV Series)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvSeriesBloc, TvSeriesState>(
          builder: (context, state) {
            if (state is PopularTvSeriesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularTvSeriesHasData) {
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
