import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_db_app/parser/date_time_try_converter.dart';

part 'movie_list_result.freezed.dart';
part 'movie_list_result.g.dart';

@freezed
abstract class MovieListResult with _$MovieListResult {
  @JsonSerializable(explicitToJson: true)
  const factory MovieListResult({
    @JsonKey(name: 'poster_path') String? posterPath,
    required bool adult,
    required String overview,
    @JsonKey(name: 'release_date')
    @DateTimeTryConverter()
        DateTime? releaseDate,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    required int id,
    @JsonKey(name: 'original_title') required String originalTitle,
    @JsonKey(name: 'original_language') required String originalLanguage,
    required String title,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    required double popularity,
    @JsonKey(name: 'vote_count') required int voteCount,
    required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
  }) = _MovieListResult;

  factory MovieListResult.fromJson(Map<String, dynamic> json) =>
      _$MovieListResultFromJson(json);
}
