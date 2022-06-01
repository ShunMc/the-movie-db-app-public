import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_movie_db_app/data/model/movie_list_result.dart';
import 'package:the_movie_db_app/ui/components/movie_list_result_view.dart';

final movieResultsListLoadingProvider = StateProvider<bool>(
  (ref) => false,
);

class MovieResultsListView extends ConsumerWidget {
  const MovieResultsListView(
    this.results, {
    Key? key,
    this.controller,
  }) : super(key: key);

  final List<MovieListResult> results;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        GridView.count(
          controller: controller,
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          children: results
              .map(
                (value) => MovieListResultView(
                  value,
                  key: ValueKey(value.id),
                ),
              )
              .toList(),
        ),
        if (ref.watch(movieResultsListLoadingProvider))
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black12,
          ),
        if (ref.watch(movieResultsListLoadingProvider))
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
