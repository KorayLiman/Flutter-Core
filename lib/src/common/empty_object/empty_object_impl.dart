import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';


@immutable
final class EmptyObject extends BaseModel<EmptyObject> {
  const EmptyObject();

  @override
  EmptyObject fromJson(Map<String, Object?> json) => const EmptyObject();

  @override
  Map<String, Object?> toJson() => {};
}
