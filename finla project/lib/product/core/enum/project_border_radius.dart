import 'package:flutter/material.dart';

/// ProjectRadius Enum
enum ProjectBorderRadius {
  /// Small radius 10 px
  small(10),

  /// Medium radius 20 px
  medium(20),

  /// Large radius 30 px
  large(30);

  final double _value;

  /// Constructor
  // ignore: sort_constructors_first
  const ProjectBorderRadius(this._value);

  BorderRadius get _borderRadius => BorderRadius.circular(_value);

  /// BorderRadius Getter
  BorderRadius get borderRadius => _borderRadius;
}
