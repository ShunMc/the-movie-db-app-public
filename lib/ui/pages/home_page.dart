import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_movie_db_app/data/movie_list.dart';
import 'package:the_movie_db_app/data/tmdb_client.dart';
import 'package:the_movie_db_app/hook/use_l10n.dart';
import 'package:the_movie_db_app/hook/use_theme.dart';
import 'package:the_movie_db_app/ui/components/movie_results_list_view.dart';
import 'package:the_movie_db_app/ui/locale.dart';
import 'package:the_movie_db_app/ui/movie_list.dart';

enum ListState {
  none,
  shouldLoad,
  loading,
  canceled,
  completed,
}

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ScrollController();
    final l10n = useL10n();
    final theme = useTheme();
    final page = useState(0);
    final searchKeyword = useState('');
    final isSearch = useState(false);
    final state = useState(ListState.shouldLoad);
    final isTop = useState(true);

    useEffect(
      () {
        void onScroll() {
          isTop.value = scrollController.offset <= 0;
          if (state.value != ListState.none) {
            return;
          }
          if (scrollController.offset >
              scrollController.position.maxScrollExtent - 250) {
            state.value = ListState.shouldLoad;
          }
        }

        scrollController.addListener(onScroll);
        return () => scrollController.removeListener(onScroll);
      },
      [scrollController],
    );

    if (state.value == ListState.shouldLoad) {
      state.value = ListState.loading;
      Future.delayed(const Duration(microseconds: 1), () {
        getPopularOrSearch(
          ref.read(tmdbClientProvider),
          searchKeyword.value,
          ref.watch(localeLanguageCodeProvider),
          ++page.value,
        ).then(
          (value) {
            if (state.value == ListState.canceled) {
              return;
            }
            ref.read(movieListProvider.notifier).addAll(value.results);
            state.value = ListState.none;
            if (page.value == value.totalPages) {
              state.value = ListState.completed;
            }
          },
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: isSearch.value
            ? TextField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  fillColor: theme.backgroundColor,
                  filled: true,
                  hintText: l10n.search,
                ),
                onSubmitted: (value) {
                  page.value = 0;
                  ref.read(movieListProvider.notifier).clear();
                  searchKeyword.value = value;
                  state.value = ListState.shouldLoad;
                },
              )
            : Text(l10n.popular),
        actions: [
          IconButton(
            icon: isSearch.value
                ? const Icon(Icons.clear)
                : const Icon(Icons.search),
            onPressed: () {
              isSearch.value = !isSearch.value;
              page.value = 0;
              ref.read(movieListProvider.notifier).clear();
              searchKeyword.value = '';
              state.value =
                  isSearch.value ? ListState.canceled : ListState.shouldLoad;
            },
          ),
          if (!isSearch.value)
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => context.push('/settings'),
            ),
        ],
      ),
      body: MovieResultsListView(
        ref.watch(movieListProvider),
        controller: scrollController,
      ),
      floatingActionButton: isTop.value
          ? null
          : FloatingActionButton(
              onPressed: () => _scrollToTop(scrollController),
              child: const Icon(Icons.navigation),
            ),
    );
  }

  void _scrollToTop(ScrollController controller) {
    controller.animateTo(
      0,
      duration: Duration(
        milliseconds:
            controller.offset > 2500 ? 500 : (controller.offset / 5).round(),
      ),
      curve: Curves.easeOut,
    );
  }
}
