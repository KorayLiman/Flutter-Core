import 'package:flcore/flcore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class FLTextButton extends StatelessWidget {
  const FLTextButton({
    required this.child,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.minSize = kMinInteractiveDimensionCupertino,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    super.key,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double minSize;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return switch (context.theme.platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => CupertinoButton(
          onPressed: onPressed,
          padding: padding,
          minSize: minSize,
          child: child,
        ),
      _ => TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: padding,
            minimumSize: Size(minSize, minSize),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          child: child,
        ),
    };
  }
}

@immutable
class FLOutlinedButton extends StatelessWidget {
  const FLOutlinedButton({
    required this.child,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.minSize = kMinInteractiveDimensionCupertino,
    this.borderColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    super.key,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double minSize;
  final Color? borderColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return switch (context.theme.platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            padding: padding,
            side: BorderSide(color: borderColor ?? context.colorScheme.primary),
            minimumSize: Size(minSize, minSize),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          child: child,
        ),
      _ => OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: padding,
            side: BorderSide(color: borderColor ?? context.colorScheme.primary),
            minimumSize: Size(minSize, minSize),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          child: child,
        ),
    };
  }
}

@immutable
class FLFilledButton extends StatelessWidget {
  const FLFilledButton({
    required this.child,
    required this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.minSize = kMinInteractiveDimensionCupertino,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    super.key,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final BorderRadius borderRadius;
  final double minSize;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return switch (context.theme.platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => CupertinoButton(
          onPressed: onPressed,
          padding: padding,
          color: backgroundColor ?? context.theme.colorScheme.primary,
          minSize: minSize,
          borderRadius: borderRadius,
          child: child,
        ),
      _ => FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            minimumSize: Size(minSize, minSize),
            backgroundColor: backgroundColor,
            padding: padding,
          ),
          child: child,
        ),
    };
  }
}

@immutable
class FLIconButton extends StatelessWidget {
  const FLIconButton({
    required this.icon,
    required this.onPressed,
    this.radius = kMinInteractiveDimensionCupertino * 0.5,
    super.key,
  })  : filled = false,
        backgroundColor = null;

  const FLIconButton.filled({
    required this.icon,
    required this.onPressed,
    this.radius = kMinInteractiveDimensionCupertino * 0.5,
    this.backgroundColor,
    super.key,
  }) : filled = true;

  final Widget icon;
  final VoidCallback? onPressed;
  final bool filled;
  final double radius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return switch (context.theme.platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => CupertinoButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          minSize: radius * 2,
          child: filled
              ? CircleAvatar(
                  backgroundColor: backgroundColor ?? context.theme.colorScheme.primary,
                  radius: radius,
                  child: icon,
                )
              : icon,
        ),
      _ => filled
          ? IconButton.filled(
              onPressed: onPressed,
              icon: icon,
              padding: EdgeInsets.zero,
              style: IconButton.styleFrom(
                minimumSize: Size(radius * 2, radius * 2),
                backgroundColor: backgroundColor,
              ),
            )
          : IconButton(
              onPressed: onPressed,
              icon: icon,
              padding: EdgeInsets.zero,
              style: IconButton.styleFrom(
                minimumSize: Size(radius * 2, radius * 2),
              ),
            ),
    };
  }
}
