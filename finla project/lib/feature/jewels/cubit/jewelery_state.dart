import 'package:dev_template/product/core/model/jewelery.dart';
import 'package:equatable/equatable.dart';

enum JeweleryStatus {
  initial,
  loading,
  loaded,
  error,
}

final class JeweleryState extends Equatable {
  const JeweleryState({
    required this.status,
    this.products = const <Jewelery>[],
    this.error = '',
  });

  final JeweleryStatus status;
  final List<Jewelery> products;
  final String error;

  @override
  List<Object> get props => [status, products, error];

  JeweleryState copyWith({
    JeweleryStatus? status,
    List<Jewelery>? products,
    String? error,
  }) {
    return JeweleryState(
      status: status ?? this.status,
      products: products ?? this.products,
      error: error ?? this.error,
    );
  }
}
