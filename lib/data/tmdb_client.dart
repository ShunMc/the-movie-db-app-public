import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_api/tmdb_api.dart';

// Required TMDB APIKEY
final tmdbApiKeyProvider = Provider(
  (ref) => '',
);

final tmdbClientProvider = Provider<TMDB>(
  (ref) => TMDB(
    ApiKeys(
      ref.read(tmdbApiKeyProvider),
      '',
    ),
    dio: Dio(),
  ),
);
