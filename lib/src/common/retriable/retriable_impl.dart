import 'dart:async';

import 'package:meta/meta.dart';

abstract class Retriable<T> {
  Retriable({this.maxRetries = 3});

  late T _result;
  var _isSuccess = false;
  var _attempts = 0;

  final int maxRetries;

  FutureOr<T> retryFn();

  @mustCallSuper
  Future<T> execute() async {
    while (!_isSuccess && _attempts < maxRetries) {
      try {
        _result = await retryFn();
        _isSuccess = true;
      } catch (e) {
        _attempts++;
        if (_attempts == maxRetries) {
          rethrow;
        }
      }
    }
    return _result;
  }
}
