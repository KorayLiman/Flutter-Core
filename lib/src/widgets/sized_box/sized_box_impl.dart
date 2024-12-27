import 'package:flutter/material.dart';

@immutable
class FLSizedBox extends SizedBox {
  const FLSizedBox({super.child, super.width, super.height, super.key});

  const FLSizedBox.shrink({super.key, super.child}) : super.shrink();

  const FLSizedBox.expand({super.key, super.child}) : super.expand();

  FLSizedBox operator +(FLSizedBox other) {
    return FLSizedBox(
      width: (width ?? 0.0) + (other.width ?? 0.0),
      height: (height ?? 0.0) + (other.height ?? 0.0),
    );
  }

  FLSizedBox operator -(FLSizedBox other) {
    return FLSizedBox(
      width: (width ?? 0.0) - (other.width ?? 0.0),
      height: (height ?? 0.0) - (other.height ?? 0.0),
    );
  }
}
