import 'package:the_movie_db_app/data/model/movie_results.dart';
import 'package:tmdb_api/tmdb_api.dart';

Future<MovieResults> getPopularOrSearch(
  TMDB tmdb,
  String keyword,
  String language,
  int page,
) {
  if (keyword.isEmpty) {
    return getPopular(tmdb, language, page);
  } else {
    return search(tmdb, keyword, language, page);
  }
}

Future<MovieResults> getPopular(
  TMDB tmdb,
  String language,
  int page,
) async {
  final map = await tmdb.v3.movies.getPopular(
    language: language,
    page: page,
  );
  return MovieResults.fromJson(map.cast<String, dynamic>());
}

Future<MovieResults> search(
  TMDB tmdb,
  String keyword,
  String language,
  int page,
) async {
  final map = await tmdb.v3.search.queryMovies(
    keyword,
    language: language,
    page: page,
  );
  return MovieResults.fromJson(map.cast<String, dynamic>());
}
