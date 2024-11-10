import 'package:json_annotation/json_annotation.dart';
import 'package:panfleto_app/data/enum/category.dart';


part 'unique_product_model.g.dart';

@JsonSerializable()
class UniqueProductModel {
  UniqueProductModel({
    required this.productId,
    required this.productName,
    required this.price,
    required this.image,
    required this.productCategories,
  });

  final int productId;
  final String productName;
  final double price;
  final String image;
  List<Category>? productCategories;

  factory UniqueProductModel.fromJson(Map<String, dynamic> json) =>
      _$UniqueProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$UniqueProductModelToJson(this);
}
