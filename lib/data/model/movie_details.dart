import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_db_app/data/model/genre.dart';
import 'package:the_movie_db_app/parser/date_time_try_converter.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
abstract class MovieDetails with _$MovieDetails {
  @JsonSerializable(explicitToJson: true)
  const factory MovieDetails({
    required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    required int budget,
    required List<Genre> genres,
    String? homepage,
    required int id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    String? overview,
    required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date')
    @DateTimeTryConverter()
        DateTime? releaseDate,
    required int revenue,
    int? runtime,
    required String status,
    String? tagline,
    required String title,
    required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);
}
