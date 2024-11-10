import 'package:json_annotation/json_annotation.dart';
import 'package:panfleto_app/data/model/offer_model.dart';
import 'package:panfleto_app/utils/time_util.dart';

part 'market_model.g.dart';

@JsonSerializable()
@TimeOnlyConverter()
class MarketModel {
  final int id;
  final String name;
  final String address;
  final String imgUrl;

  final DateTime? openingTimeMonday;
  final DateTime? closingTimeMonday;

  final DateTime? openingTimeTuesday;
  final DateTime? closingTimeTuesday;

  final DateTime? openingTimeWednesday;
  final DateTime? closingTimeWednesday;

  final DateTime? openingTimeThursday;
  final DateTime? closingTimeThursday;

  final DateTime? openingTimeFriday;
  final DateTime? closingTimeFriday;

  final DateTime? openingTimeSaturday;
  final DateTime? closingTimeSaturday;

  final DateTime? openingTimeSunday;
  final DateTime? closingTimeSunday;

  final List<OfferModel> offers;

  MarketModel(
    this.openingTimeMonday,
    this.closingTimeMonday,
    this.openingTimeTuesday,
    this.closingTimeTuesday,
    this.openingTimeWednesday,
    this.closingTimeWednesday,
    this.openingTimeThursday,
    this.closingTimeThursday,
    this.openingTimeFriday,
    this.closingTimeFriday,
    this.openingTimeSaturday,
    this.closingTimeSaturday,
    this.openingTimeSunday,
    this.closingTimeSunday, {
    required this.id,
    required this.name,
    required this.address,
    required this.imgUrl,
    required this.offers,
  });

  factory MarketModel.fromJson(Map<String, dynamic> json) =>
      _$MarketModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketModelToJson(this);
}
