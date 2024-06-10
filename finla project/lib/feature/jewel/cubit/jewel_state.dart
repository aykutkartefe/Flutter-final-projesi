import 'package:dev_template/product/core/model/jewel.dart';
import 'package:equatable/equatable.dart';

enum JewelStatus { initial, loading, success, failure }

final class JewelState extends Equatable {
  const JewelState({
    this.status = JewelStatus.initial,
    this.shoes = const <Jewel>[],
    this.error,
  });

  final JewelStatus status;
  final List<Jewel> shoes;
  final String? error;

  JewelState copyWith({
    JewelStatus? status,
    List<Jewel>? shoes,
    String? error,
  }) {
    return JewelState(
      status: status ?? this.status,
      shoes: shoes ?? this.shoes,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, shoes, error];
}
