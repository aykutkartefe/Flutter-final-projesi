// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jewel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Jewel _$JewelFromJson(Map<String, dynamic> json) => Jewel(
      brand: json['brand'] as String?,
      type: json['type'] as String?,
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$JewelToJson(Jewel instance) => <String, dynamic>{
      'brand': instance.brand,
      'type': instance.type,
      'price': instance.price,
    };
