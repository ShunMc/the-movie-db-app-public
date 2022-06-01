import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeModeProvider = StateProvider<ThemeMode>(
  (ref) => ThemeMode.system,
);

final lightThemeData = Provider<ThemeData>(
  (ref) => ThemeData(primarySwatch: Colors.blueGrey),
);

final darkThemeData = Provider<ThemeData>(
  (ref) => ThemeData(
    brightness: Brightness.dark,
  ),
);
