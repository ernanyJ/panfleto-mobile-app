import 'package:json_annotation/json_annotation.dart';
import 'package:panfleto_app/data/enum/category.dart';
import 'package:panfleto_app/data/model/unique_product_model.dart';

part 'offer_model.g.dart';

@JsonSerializable()
class OfferModel {
  final int id;
  final String title;
  final String description;
  final String? imgUrl;
  final List<Category> includedCategories;
  final List<UniqueProductModel>? products;

  OfferModel( {
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.includedCategories,
    required this.products
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfferModelToJson(this);
}
