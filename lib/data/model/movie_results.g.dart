// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieResults _$$_MovieResultsFromJson(Map<String, dynamic> json) =>
    _$_MovieResults(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieListResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$$_MovieResultsToJson(_$_MovieResults instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
