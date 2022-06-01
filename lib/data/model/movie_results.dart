import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_db_app/data/model/movie_list_result.dart';

part 'movie_results.freezed.dart';
part 'movie_results.g.dart';

@freezed
abstract class MovieResults with _$MovieResults {
  const factory MovieResults({
    required int page,
    required List<MovieListResult> results,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _MovieResults;

  factory MovieResults.fromJson(Map<String, dynamic> json) =>
      _$MovieResultsFromJson(json);
}
