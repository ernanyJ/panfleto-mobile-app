// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num).toInt(),
      imgUrl: json['imgUrl'] as String,
      name: json['name'] as String,
      normalizedName: json['normalizedName'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => $enumDecode(_$CategoryEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'name': instance.name,
      'normalizedName': instance.normalizedName,
      'categories':
          instance.categories.map((e) => _$CategoryEnumMap[e]!).toList(),
    };

const _$CategoryEnumMap = {
  Category.HYGIENE: 'HYGIENE',
  Category.REFRIGERATED: 'REFRIGERATED',
  Category.FRUITS: 'FRUITS',
  Category.VEGETABLES: 'VEGETABLES',
  Category.BAKERY: 'BAKERY',
  Category.ELECTRONICS: 'ELECTRONICS',
  Category.BEVERAGES: 'BEVERAGES',
  Category.STAPLES: 'STAPLES',
  Category.LACTIC: 'LACTIC',
};
