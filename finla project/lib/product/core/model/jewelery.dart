import 'package:dev_template/product/core/model/rating_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jewelery.g.dart';

@JsonSerializable()
class Jewelery with EquatableMixin {
  Jewelery({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Jewelery.fromJson(Map<String, dynamic> json) =>
      _$JeweleryFromJson(json);
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'rating')
  RatingModel? rating;

  Map<String, dynamic> toJson() => _$JeweleryToJson(this);

  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rating];

  Jewelery copyWith({
    int? id,
    String? title,
    int? price,
    String? description,
    String? category,
    String? image,
    RatingModel? rating,
  }) {
    return Jewelery(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }
}
