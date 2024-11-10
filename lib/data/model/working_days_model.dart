import 'package:json_annotation/json_annotation.dart';
import 'package:panfleto_app/core/time_converter.dart';

part 'working_days_model.g.dart';

@JsonSerializable()
@TimeConverter()
class WorkingDaysModel {
  final int id;
  final DayOfWeek weekDay;
  final DateTime openingTime;
  final DateTime closingTime;

  WorkingDaysModel({
    required this.id,
    required this.weekDay,
    required this.openingTime,
    required this.closingTime,
  });

  factory WorkingDaysModel.fromJson(Map<String, dynamic> json) =>
      _$WorkingDaysModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkingDaysModelToJson(this);
}

enum DayOfWeek {
  SUNDAY,
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
}
