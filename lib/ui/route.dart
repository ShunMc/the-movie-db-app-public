import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_db_app/data/model/movie_details.dart';
import 'package:the_movie_db_app/ui/pages/home_page.dart';
import 'package:the_movie_db_app/ui/pages/movie_details_page.dart';
import 'package:the_movie_db_app/ui/pages/settings_page.dart';
import 'package:the_movie_db_app/ui/pages/theme_settings_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      name: 'settings',
      path: '/settings',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SettingsPage(),
      ),
    ),
    GoRoute(
      name: 'themeSettings',
      path: '/theme',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const ThemeSettingsPage(),
      ),
    ),
    GoRoute(
      name: 'details',
      path: '/details',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: MovieDetailsPage(details: state.extra! as MovieDetails),
      ),
    ),
  ],
);
