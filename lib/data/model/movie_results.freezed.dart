// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieResults _$MovieResultsFromJson(Map<String, dynamic> json) {
  return _MovieResults.fromJson(json);
}

/// @nodoc
mixin _$MovieResults {
  int get page => throw _privateConstructorUsedError;
  List<MovieListResult> get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieResultsCopyWith<MovieResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieResultsCopyWith<$Res> {
  factory $MovieResultsCopyWith(
          MovieResults value, $Res Function(MovieResults) then) =
      _$MovieResultsCopyWithImpl<$Res>;
  $Res call(
      {int page,
      List<MovieListResult> results,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class _$MovieResultsCopyWithImpl<$Res> implements $MovieResultsCopyWith<$Res> {
  _$MovieResultsCopyWithImpl(this._value, this._then);

  final MovieResults _value;
  // ignore: unused_field
  final $Res Function(MovieResults) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieListResult>,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MovieResultsCopyWith<$Res>
    implements $MovieResultsCopyWith<$Res> {
  factory _$MovieResultsCopyWith(
          _MovieResults value, $Res Function(_MovieResults) then) =
      __$MovieResultsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int page,
      List<MovieListResult> results,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class __$MovieResultsCopyWithImpl<$Res> extends _$MovieResultsCopyWithImpl<$Res>
    implements _$MovieResultsCopyWith<$Res> {
  __$MovieResultsCopyWithImpl(
      _MovieResults _value, $Res Function(_MovieResults) _then)
      : super(_value, (v) => _then(v as _MovieResults));

  @override
  _MovieResults get _value => super._value as _MovieResults;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_MovieResults(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieListResult>,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieResults implements _MovieResults {
  const _$_MovieResults(
      {required this.page,
      required final List<MovieListResult> results,
      @JsonKey(name: 'total_pages') required this.totalPages,
      @JsonKey(name: 'total_results') required this.totalResults})
      : _results = results;

  factory _$_MovieResults.fromJson(Map<String, dynamic> json) =>
      _$$_MovieResultsFromJson(json);

  @override
  final int page;
  final List<MovieListResult> _results;
  @override
  List<MovieListResult> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;

  @override
  String toString() {
    return 'MovieResults(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieResults &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.results, results) &&
            const DeepCollectionEquality()
                .equals(other.totalPages, totalPages) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(results),
      const DeepCollectionEquality().hash(totalPages),
      const DeepCollectionEquality().hash(totalResults));

  @JsonKey(ignore: true)
  @override
  _$MovieResultsCopyWith<_MovieResults> get copyWith =>
      __$MovieResultsCopyWithImpl<_MovieResults>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieResultsToJson(this);
  }
}

abstract class _MovieResults implements MovieResults {
  const factory _MovieResults(
          {required final int page,
          required final List<MovieListResult> results,
          @JsonKey(name: 'total_pages') required final int totalPages,
          @JsonKey(name: 'total_results') required final int totalResults}) =
      _$_MovieResults;

  factory _MovieResults.fromJson(Map<String, dynamic> json) =
      _$_MovieResults.fromJson;

  @override
  int get page => throw _privateConstructorUsedError;
  @override
  List<MovieListResult> get results => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MovieResultsCopyWith<_MovieResults> get copyWith =>
      throw _privateConstructorUsedError;
}
