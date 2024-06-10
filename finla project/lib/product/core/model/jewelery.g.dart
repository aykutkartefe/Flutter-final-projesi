// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jewelery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Jewelery _$JeweleryFromJson(Map<String, dynamic> json) => Jewelery(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] == null
          ? null
          : RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JeweleryToJson(Jewelery instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };
