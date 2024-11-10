// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_days_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkingDaysModel _$WorkingDaysModelFromJson(Map<String, dynamic> json) =>
    WorkingDaysModel(
      id: (json['id'] as num).toInt(),
      weekDay: $enumDecode(_$DayOfWeekEnumMap, json['weekDay']),
      openingTime:
          const TimeConverter().fromJson(json['openingTime'] as String),
      closingTime:
          const TimeConverter().fromJson(json['closingTime'] as String),
    );

Map<String, dynamic> _$WorkingDaysModelToJson(WorkingDaysModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weekDay': _$DayOfWeekEnumMap[instance.weekDay]!,
      'openingTime': const TimeConverter().toJson(instance.openingTime),
      'closingTime': const TimeConverter().toJson(instance.closingTime),
    };

const _$DayOfWeekEnumMap = {
  DayOfWeek.SUNDAY: 'SUNDAY',
  DayOfWeek.MONDAY: 'MONDAY',
  DayOfWeek.TUESDAY: 'TUESDAY',
  DayOfWeek.WEDNESDAY: 'WEDNESDAY',
  DayOfWeek.THURSDAY: 'THURSDAY',
  DayOfWeek.FRIDAY: 'FRIDAY',
  DayOfWeek.SATURDAY: 'SATURDAY',
};
