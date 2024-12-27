import 'dart:async';

/// [Duration] EXTENSIONS
extension DurationExtension on Duration {
  /// Converts duration object to Future with an optional callback
  Future<T?> delay<T>([FutureOr<T> Function()? callback]) async => Future<T>.delayed(this, callback);
  Future<void> get future => Future.delayed(this);
}
