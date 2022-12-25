import 'package:core/core.dart';
import 'package:movies/movies.dart';
import 'package:tv_series/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:search/search.dart';

class SearchPage extends StatelessWidget {
  // ignore: constant_identifier_names
  static const ROUTE_NAME = '/search';

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var toggleNotifier =
        Provider.of<ToggleSearchNotifier>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Radio(
                  value: 'Movies',
                  groupValue: toggleNotifier.toggle,
                  onChanged: (value) {
                    toggleNotifier.setSelectedButton("Movies");
                  },
                ),
                const Text('Movies'),
                Radio(
                  value: 'TV Series',
                  groupValue: toggleNotifier.toggle,
                  onChanged: (value) {
                    toggleNotifier.setSelectedButton("TV Series");
                  },
                ),
                const Text('TV Series'),
              ],
            ),
            Text(
              "Search:",
              style: kHeading6,
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              // onSubmitted: (query) {
              //   if (toggleNotifier.toggle == 'Movies') {
              //     Provider.of<MovieSearchNotifier>(context, listen: false)
              //         .fetchMovieSearch(query);
              //   } else {
              //     Provider.of<TvSeriesSearchNotifier>(context, listen: false)
              //         .fetchTvSeriesSearch(query);
              //   }
              // },
              onChanged: (query) {
                if (toggleNotifier.toggle == 'Movies') {
                  context.read<SearchMoviesBloc>().add(OnQueryChanged(query));
                } else {
                  context.read<SearchTvSeriesBloc>().add(OnQueryChanged(query));
                }
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Search Result (${toggleNotifier.toggle}):',
              style: kHeading6,
            ),
            const SizedBox(
              height: 10,
            ),
            (toggleNotifier.toggle == 'Movies')
                ? BlocBuilder<SearchMoviesBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is SearchMoviesHasData) {
                        final result = state.result;
                        return Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final movie = result[index];
                              return MovieCard(movie);
                            },
                            itemCount: result.length,
                          ),
                        );
                      } else if (state is SearchError) {
                        return Expanded(
                          child: Center(
                            child: Text(state.message),
                          ),
                        );
                      } else {
                        return Expanded(
                          child: Container(),
                        );
                      }
                    },
                  )
                : BlocBuilder<SearchTvSeriesBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is SearchTvSeriesHasData) {
                        final result = state.result;
                        return Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final tvSeries = result[index];
                              return TvSeriesCard(tvSeries);
                            },
                            itemCount: result.length,
                          ),
                        );
                      } else if (state is SearchError) {
                        return Expanded(
                          child: Center(
                            child: Text(state.message),
                          ),
                        );
                      } else {
                        return Expanded(
                          child: Container(),
                        );
                      }
                    },
                  ),
            // Consumer2<MovieSearchNotifier, TvSeriesSearchNotifier>(
            //   builder: (context, data, data2, child) {
            //     if (data.state == RequestState.Loading ||
            //         data2.state == RequestState.Loading) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else if (data.state == RequestState.Loaded &&
            //         toggleNotifier.toggle == "Movies") {
            //       return Expanded(
            //         child: ListView.builder(
            //           padding: const EdgeInsets.all(8),
            //           itemBuilder: (context, index) {
            //             final movie = data.searchResult[index];
            //             return MovieCard(movie);
            //           },
            //           itemCount: data.searchResult.length,
            //         ),
            //       );
            //     } else if (data2.state == RequestState.Loaded &&
            //         toggleNotifier.toggle == "TV Series") {
            //       return Expanded(
            //         child: ListView.builder(
            //           padding: const EdgeInsets.all(8),
            //           itemBuilder: (context, index) {
            //             final tvSeries = data2.searchResult[index];
            //             return TvSeriesCard(tvSeries);
            //           },
            //           itemCount: data2.searchResult.length,
            //         ),
            //       );
            //     } else {
            //       return Expanded(
            //         child: Container(),
            //       );
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
