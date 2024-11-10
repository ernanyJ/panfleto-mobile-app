// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => OfferModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      imgUrl: json['imgUrl'] as String?,
      includedCategories: (json['includedCategories'] as List<dynamic>)
          .map((e) => $enumDecode(_$CategoryEnumMap, e))
          .toList(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => UniqueProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OfferModelToJson(OfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imgUrl': instance.imgUrl,
      'includedCategories': instance.includedCategories
          .map((e) => _$CategoryEnumMap[e]!)
          .toList(),
      'products': instance.products,
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
