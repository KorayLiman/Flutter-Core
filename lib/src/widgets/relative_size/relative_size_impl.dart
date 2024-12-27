import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';

@immutable
class FLRelativeHeight extends StatelessWidget {
  const FLRelativeHeight(this.percentage, {super.key}) : assert(percentage >= 0 && percentage <= 1, 'Percentage must be between 0 and 1');

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * percentage,
    );
  }
}

@immutable
class FLRelativeWidth extends StatelessWidget {
  const FLRelativeWidth(this.percentage, {super.key}) : assert(percentage >= 0 && percentage <= 1, 'Percentage must be between 0 and 1');

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * percentage,
    );
  }
}
