import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final localeProvider = StateProvider<Locale>(
  (ref) => const Locale('ja', 'JP'),
);

final localeLanguageCodeProvider = Provider<String>(
  (ref) => ref.watch(localeProvider).languageCode,
);

final localeDateFormatProvider = Provider<DateFormat>(
  (ref) => DateFormat.yMMMd(ref.watch(localeLanguageCodeProvider)),
);
