import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class TimeConverter implements JsonConverter<DateTime, String> {
  const TimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateFormat("HH:mm:ss").parse(json);
  }

  @override
  String toJson(DateTime object) {
    return DateFormat("HH:mm:ss").format(object);
  }
}
