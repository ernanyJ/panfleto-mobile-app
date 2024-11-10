// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unique_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniqueProductModel _$UniqueProductModelFromJson(Map<String, dynamic> json) =>
    UniqueProductModel(
      productId: (json['productId'] as num).toInt(),
      productName: json['productName'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      productCategories: (json['productCategories'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CategoryEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$UniqueProductModelToJson(UniqueProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'price': instance.price,
      'image': instance.image,
      'productCategories': instance.productCategories
          ?.map((e) => _$CategoryEnumMap[e]!)
          .toList(),
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
