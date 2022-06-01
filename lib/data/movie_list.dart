import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_movie_db_app/data/model/movie_list_result.dart';

final movieListProvider =
    StateNotifierProvider<MovieListNotifier, List<MovieListResult>>(
  (ref) => MovieListNotifier([]),
);

class MovieListNotifier extends StateNotifier<List<MovieListResult>> {
  MovieListNotifier(List<MovieListResult> state) : super(state);

  void add(MovieListResult value) {
    state = [...state, value];
  }

  void addAll(Iterable<MovieListResult> iterable) {
    state = [...state, ...iterable];
  }

  void clear() {
    state = [];
  }
}
