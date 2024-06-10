import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel with EquatableMixin {
  RatingModel({
    this.rate,
    this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
  @JsonKey(name: 'rate')
  double? rate;
  @JsonKey(name: 'count')
  int? count;

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);

  @override
  List<Object?> get props => [rate, count];

  RatingModel copyWith({
    double? rate,
    int? count,
  }) {
    return RatingModel(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }
}
