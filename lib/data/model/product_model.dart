import 'package:json_annotation/json_annotation.dart';
import 'package:panfleto_app/data/enum/category.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  
ProductModel({
  required this.id,
  required this.imgUrl,
  required this.name,
  required this.normalizedName,
  required this.categories,
});

final int id;
final String imgUrl;
final String name;
final String normalizedName;
final List<Category> categories;

 factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}