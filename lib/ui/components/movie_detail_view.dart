import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_movie_db_app/data/model/movie_details.dart';
import 'package:the_movie_db_app/hook/use_l10n.dart';
import 'package:the_movie_db_app/hook/use_theme.dart';
import 'package:the_movie_db_app/ui/components/movie_image.dart';
import 'package:the_movie_db_app/ui/components/vote_average_circle.dart';
import 'package:the_movie_db_app/ui/locale.dart';

class MovieDetailView extends HookConsumerWidget {
  const MovieDetailView(
    this.details, {
    Key? key,
  }) : super(key: key);

  final MovieDetails details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = useTheme();
    return Column(
      children: [
        // HeaderImages
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 220,
              child: MovieImage(details.backdropPath, resolution: 'original'),
            ),
            Positioned(
              left: 10,
              top: 20,
              bottom: 20,
              child: MovieImage(
                details.posterPath,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        // TitleName
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: details.title,
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: '(${details.releaseDate?.year})',
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // UserScore
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: '[VoteAverage]${details.id}',
                child: VoteAverageCircle(
                  averagePercent: (details.voteAverage * 10).round(),
                  size: 50,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                l10n.userScore,
                style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        // MovieInfo
        Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          color: theme.colorScheme.background,
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    if (details.releaseDate != null)
                      TextSpan(
                        text: ref
                            .read(localeDateFormatProvider)
                            .format(details.releaseDate!),
                        style: theme.textTheme.bodySmall,
                      ),
                    if (details.releaseDate != null) const TextSpan(text: ' '),
                    TextSpan(
                      text:
                          '${(details.runtime! / 60).floor()}h ${details.runtime! % 60}m',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Text(
                details.genres.map((e) => e.name).toList().join(','),
              ),
            ],
          ),
        ),
        // Overview
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (details.tagline?.isNotEmpty ?? false)
                Text(
                  details.tagline!,
                  style: theme.textTheme.displaySmall!.copyWith(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              Text(
                l10n.overview,
                style: theme.textTheme.titleLarge,
              ),
              Text(
                details.overview?.isEmpty ?? true
                    ? 'No Data'
                    : details.overview!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
