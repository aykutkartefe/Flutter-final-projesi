import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jewel.g.dart';

@JsonSerializable()
class Jewel with EquatableMixin {
  Jewel({
    this.brand,
    this.type,
    this.price,
  });

  factory Jewel.fromJson(Map<String, dynamic> json) => _$JewelFromJson(json);
  @JsonKey(name: 'brand')
  String? brand;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'price')
  int? price;

  Map<String, dynamic> toJson() => _$JewelToJson(this);

  @override
  List<Object?> get props => [brand, type, price];

  Jewel copyWith({
    String? brand,
    String? type,
    int? price,
  }) {
    return Jewel(
      brand: brand ?? this.brand,
      type: type ?? this.type,
      price: price ?? this.price,
    );
  }
}
