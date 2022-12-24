// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TvSeriesDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-tvseries';

  final int id;
  const TvSeriesDetailPage({super.key, required this.id});

  @override
  // ignore: library_private_types_in_public_api
  _TvSeriesDetailPageState createState() => _TvSeriesDetailPageState();
}

class _TvSeriesDetailPageState extends State<TvSeriesDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvSeriesDetailBloc>().add(
            TvSeriesDetailEvent(widget.id),
          );
      context.read<TvSeriesRecommendationsBloc>().add(
            TvSeriesRecommendations(widget.id),
          );
      context.read<WatchlistTvSeriesBloc>().add(
            WatchlistTvSeriesStatus(widget.id),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isAddedWatchlist =
        context.select<WatchlistTvSeriesBloc, bool>((value) {
      if (value.state is WatchlistTvSeriesStatusState) {
        return (value.state as WatchlistTvSeriesStatusState).result;
      }
      return false;
    });
    return Scaffold(
      body: BlocBuilder<TvSeriesDetailBloc, TvSeriesState>(
        builder: (context, state) {
          if (state is TvSeriesDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvSeriesDetailHasData) {
            final tvSeries = state.result;
            return SafeArea(
              child: DetailContent(
                tvSeries,
                isAddedWatchlist,
              ),
            );
          } else {
            return const Text('Failed');
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class DetailContent extends StatefulWidget {
  final TvSeriesDetail tvSeries;
  bool isAddedWatchlist;

  DetailContent(this.tvSeries, this.isAddedWatchlist, {super.key});

  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const messageWatchlistAddSuccess = 'Added to Watchlist';
    const messageWatchlistRemoveSuccess = 'Removed from Watchlist';
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://image.tmdb.org/t/p/w500${widget.tvSeries.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.tvSeries.name,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (!widget.isAddedWatchlist) {
                                  context.read<WatchlistTvSeriesBloc>().add(
                                      SaveWatchlistTvSeriesEvent(
                                          widget.tvSeries));
                                } else {
                                  context.read<WatchlistTvSeriesBloc>().add(
                                      RemoveWatchlistTvSeriesEvent(
                                          widget.tvSeries));
                                }

                                final message = context.select<
                                    WatchlistTvSeriesBloc,
                                    String>((value) => (value.state
                                        is WatchlistTvSeriesStatusState)
                                    ? (value.state as WatchlistTvSeriesStatusState)
                                                .result ==
                                            false
                                        ? messageWatchlistAddSuccess
                                        : messageWatchlistRemoveSuccess
                                    : !widget.isAddedWatchlist
                                        ? messageWatchlistAddSuccess
                                        : messageWatchlistRemoveSuccess);

                                if (message == messageWatchlistAddSuccess ||
                                    message == messageWatchlistRemoveSuccess) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message)));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(message),
                                        );
                                      });
                                }
                                setState(() {
                                  widget.isAddedWatchlist =
                                      !widget.isAddedWatchlist;
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  widget.isAddedWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(widget.tvSeries.genres),
                            ),
                            Text(
                              "Status: ${widget.tvSeries.status}",
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: widget.tvSeries.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${widget.tvSeries.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              widget.tvSeries.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Last Episode",
                              style: kHeading6,
                            ),
                            const SizedBox(height: 5),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 16,
                                right: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ep. ${widget.tvSeries.lastEpisodeToAir!.episodeNumber} Season ${widget.tvSeries.lastEpisodeToAir!.seasonNumber}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: kHeading6,
                                  ),
                                  // SizedBox(height: ),
                                  Text(
                                    "Air Date: ${widget.tvSeries.lastEpisodeToAir!.airDate ?? "-"}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    widget.tvSeries.lastEpisodeToAir!
                                            .overview ??
                                        "-",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            (widget.tvSeries.nextEpisodeToAir != null)
                                ? Text(
                                    "Next Episode",
                                    style: kHeading6,
                                  )
                                : const SizedBox(),
                            (widget.tvSeries.nextEpisodeToAir != null)
                                ? const SizedBox(height: 5)
                                : const SizedBox(),
                            (widget.tvSeries.nextEpisodeToAir != null)
                                ? Container(
                                    margin: const EdgeInsets.only(
                                      left: 16,
                                      right: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Ep. ${widget.tvSeries.nextEpisodeToAir!.episodeNumber} Season ${widget.tvSeries.nextEpisodeToAir!.seasonNumber}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: kHeading6,
                                        ),
                                        // SizedBox(height: ),
                                        Text(
                                          "Air Date: ${widget.tvSeries.nextEpisodeToAir!.airDate ?? "-"}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          widget.tvSeries.nextEpisodeToAir!
                                                  .overview ??
                                              "-",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            // Consumer<TvSeriesDetailNotifier>(
                            BlocBuilder<TvSeriesRecommendationsBloc,
                                TvSeriesState>(
                              builder: (context, state) {
                                if (state is TvSeriesRecommendationsLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state
                                    is TvSeriesRecommendationsError) {
                                  return Text(state.message);
                                } else if (state
                                    is TvSeriesRecommendationsHasData) {
                                  // ignore: sized_box_for_whitespace
                                  final recommendations = state.result;
                                  return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final tvSeries = recommendations[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                TvSeriesDetailPage.ROUTE_NAME,
                                                arguments: tvSeries.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: recommendations.length,
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
