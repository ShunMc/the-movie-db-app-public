import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeTryConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeTryConverter();

  @override
  DateTime? fromJson(String? json) {
    return json == null ? null : DateTime.tryParse(json);
  }

  @override
  String? toJson(DateTime? object) {
    return object?.toIso8601String();
  }
}
