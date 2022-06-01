import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_movie_db_app/ui/locale.dart';
import 'package:the_movie_db_app/ui/route.dart';
import 'package:the_movie_db_app/ui/theme.dart';

class TheMovieDbApp extends ConsumerWidget {
  const TheMovieDbApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      themeMode: ref.watch(themeModeProvider),
      theme: ref.read(lightThemeData),
      darkTheme: ref.read(darkThemeData),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null) {
          WidgetsBinding.instance?.addPostFrameCallback(
            (_) => ref.read(localeProvider.state).state = locale,
          );
        }
        return locale;
      },
    );
  }
}
