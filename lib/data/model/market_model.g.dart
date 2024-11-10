// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketModel _$MarketModelFromJson(Map<String, dynamic> json) => MarketModel(
      _$JsonConverterFromJson<String, DateTime>(
          json['openingTimeMonday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['closingTimeMonday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['openingTimeTuesday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['closingTimeTuesday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['openingTimeWednesday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['closingTimeWednesday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['openingTimeThursday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['closingTimeThursday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['openingTimeFriday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['closingTimeFriday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['openingTimeSaturday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['closingTimeSaturday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['openingTimeSunday'], const TimeOnlyConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['closingTimeSunday'], const TimeOnlyConverter().fromJson),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imgUrl: json['imgUrl'] as String,
      offers: (json['offers'] as List<dynamic>)
          .map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$MarketModelToJson(MarketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
      'openingTimeMonday': _$JsonConverterToJson<String, DateTime>(
          instance.openingTimeMonday, const TimeOnlyConverter().toJson),
      'closingTimeMonday': _$JsonConverterToJson<String, DateTime>(
          instance.closingTimeMonday, const TimeOnlyConverter().toJson),
      'openingTimeTuesday': _$JsonConverterToJson<String, DateTime>(
          instance.openingTimeTuesday, const TimeOnlyConverter().toJson),
      'closingTimeTuesday': _$JsonConverterToJson<String, DateTime>(
          instance.closingTimeTuesday, const TimeOnlyConverter().toJson),
      'openingTimeWednesday': _$JsonConverterToJson<String, DateTime>(
          instance.openingTimeWednesday, const TimeOnlyConverter().toJson),
      'closingTimeWednesday': _$JsonConverterToJson<String, DateTime>(
          instance.closingTimeWednesday, const TimeOnlyConverter().toJson),
      'openingTimeThursday': _$JsonConverterToJson<String, DateTime>(
          instance.openingTimeThursday, const TimeOnlyConverter().toJson),
      'closingTimeThursday': _$JsonConverterToJson<String, DateTime>(
          instance.closingTimeThursday, const TimeOnlyConverter().toJson),
      'openingTimeFriday': _$JsonConverterToJson<String, DateTime>(
          instance.openingTimeFriday, const TimeOnlyConverter().toJson),
      'closingTimeFriday': _$JsonConverterToJson<String, DateTime>(
          instance.closingTimeFriday, const TimeOnlyConverter().toJson),
      'openingTimeSaturday': _$JsonConverterToJson<String, DateTime>(
          instance.openingTimeSaturday, const TimeOnlyConverter().toJson),
      'closingTimeSaturday': _$JsonConverterToJson<String, DateTime>(
          instance.closingTimeSaturday, const TimeOnlyConverter().toJson),
      'openingTimeSunday': _$JsonConverterToJson<String, DateTime>(
          instance.openingTimeSunday, const TimeOnlyConverter().toJson),
      'closingTimeSunday': _$JsonConverterToJson<String, DateTime>(
          instance.closingTimeSunday, const TimeOnlyConverter().toJson),
      'offers': instance.offers,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
