import 'package:json_annotation/json_annotation.dart';

class TimeOnlyConverter implements JsonConverter<DateTime, String> {
  const TimeOnlyConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse("1970-01-01 $json"); // Data fictícia para o tempo
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String().substring(11, 19); // Retorna somente 'HH:mm:ss'
  }
}
