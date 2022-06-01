# the_movie_db_app
The Movie Database Client App

## Getting Started
1. Get The Movie Database's ApiKey
https://www.themoviedb.org/documentation/api

2. Fix lib/data/tmdb_client.dart 
```dart
// Insert tmdb's ApiKey
final tmdbApiKeyProvider = Provider(
  (ref) => '',
);
```
