import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_movie_db_app/data/model/movie_details.dart';
import 'package:the_movie_db_app/data/model/movie_list_result.dart';
import 'package:the_movie_db_app/data/tmdb_client.dart';
import 'package:the_movie_db_app/hook/use_theme.dart';
import 'package:the_movie_db_app/ui/components/movie_image.dart';
import 'package:the_movie_db_app/ui/components/movie_results_list_view.dart';
import 'package:the_movie_db_app/ui/components/vote_average_circle.dart';
import 'package:the_movie_db_app/ui/locale.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieListResultView extends HookConsumerWidget {
  const MovieListResultView(
    this.listResult, {
    Key? key,
  }) : super(key: key);

  final MovieListResult listResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    return Card(
      child: InkWell(
        onTap: () async {
          ref.read(movieResultsListLoadingProvider.notifier).state = true;
          final movieDetails = await _fetchMovieDetails(
            ref.read(tmdbClientProvider),
            listResult.id,
            ref.watch(localeLanguageCodeProvider),
          );
          ref.read(movieResultsListLoadingProvider.notifier).state = false;
          context.push('/details', extra: movieDetails);
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    child: MovieImage(
                      listResult.posterPath,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      listResult.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Text(
                  listResult.releaseDate == null
                      ? ''
                      : ref
                          .read(localeDateFormatProvider)
                          .format(listResult.releaseDate!),
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            Positioned(
              bottom: 70,
              child: Hero(
                tag: '[VoteAverage]${listResult.id}',
                child: VoteAverageCircle(
                  averagePercent: (listResult.voteAverage * 10).round(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<MovieDetails> _fetchMovieDetails(
    TMDB tmdb,
    int id,
    String language,
  ) async {
    final map = await tmdb.v3.movies.getDetails(id, language: language);
    return MovieDetails.fromJson(map.cast<String, dynamic>());
  }
}
