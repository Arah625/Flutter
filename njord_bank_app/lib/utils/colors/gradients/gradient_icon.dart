// radiant_gradient_mask.dart
import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/constants.dart';

class GradientIcon extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  final AlignmentGeometry center;
  final double radius;

  const GradientIcon({
    super.key,
    required this.child,
    this.colors = goldGradient,
    this.center = Alignment.center,
    this.radius = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: center,
        radius: radius,
        colors: colors,
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
