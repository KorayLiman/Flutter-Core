import 'package:flutter/material.dart';

@immutable
final class AdaptiveAction {
  const AdaptiveAction({
    required this.label,
    this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.iconOnAndroid,
  });
  final String? label;
  final bool isDefaultAction;
  final bool isDestructiveAction;
  final IconData? iconOnAndroid;
  final void Function()? onPressed;
}
