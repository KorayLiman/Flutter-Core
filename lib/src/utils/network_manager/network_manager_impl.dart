import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flcore/flcore.dart';
import 'package:flcore/src/utils/utils.dart';
import 'package:flutter/foundation.dart';

abstract interface class IFLNetworkManager {
  Future<FLBaseResponse> request<T, M extends BaseModel<dynamic>>({required BaseRequestPath path, required RequestType type, required M responseEntityModel, BaseModel<dynamic>? data, FormData? dioFormData, BaseModel<dynamic>? queryParameters, Map<String, dynamic>? headers, String? pathSuffix, String? contentType, CancelToken? cancelToken, Duration connectionTimeout = const Duration(seconds: 25), Duration receiveTimeout = const Duration(seconds: 25), Duration sendTimeout = const Duration(seconds: 25)});

  Future<FLBaseResponse> primitiveRequest<T>({required BaseRequestPath path, required RequestType type, BaseModel<dynamic>? data, FormData? dioFormData, BaseModel<dynamic>? queryParameters, Map<String, dynamic>? headers, String? pathSuffix, String? contentType, CancelToken? cancelToken, Duration connectionTimeout = const Duration(seconds: 25), Duration receiveTimeout = const Duration(seconds: 25), Duration sendTimeout = const Duration(seconds: 25)});

  Map<String, dynamic> generateHeaders({required BaseRequestPath path});

  void onUnauthorized(DioException error);

  void onServiceUnavailable(DioException error);

  FLBaseResponse getSuccessResponse<T, M extends BaseModel<dynamic>>({required Response<Map<String, dynamic>> response, required M responseEntityModel, required bool hasBaseResponse});

  FLBaseResponse getSuccessPrimitiveResponse<T>({required Response<T> response});

  FLBaseResponse getErrorResponse<T>({required Object error});
}

abstract class FLNetworkManager with RequestLoggerMixin implements IFLNetworkManager {
  FLNetworkManager({
    this.baseOptions,
    this.interceptors = const [],
    this.printLogRequestInfo = false,
    this.printLogResponseInfo = false,
    this.printLogErrorResponseInfo = true,
  });

  final BaseOptions? baseOptions;
  final Iterable<Interceptor> interceptors;
  final bool printLogRequestInfo;
  final bool printLogResponseInfo;
  final bool printLogErrorResponseInfo;

  late final _dio = Dio(baseOptions)..interceptors.addAll(interceptors);

  @override
  Future<FLBaseResponse> request<T, M extends BaseModel<dynamic>>({
    required BaseRequestPath path,
    required RequestType type,
    required M responseEntityModel,
    bool hasBaseResponse = true,
    BaseModel<dynamic>? data,
    FormData? dioFormData,
    BaseModel<dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? pathSuffix,
    String? contentType,
    ResponseType? responseType,
    CancelToken? cancelToken,
    ValidateStatus? validateStatus,
    Duration connectionTimeout = const Duration(seconds: 25),
    Duration receiveTimeout = const Duration(seconds: 25),
    Duration sendTimeout = const Duration(seconds: 25),
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
    final startMs = DateTime.now().millisecondsSinceEpoch;
    try {
    
      final mergedHeaders = generateHeaders(path: path)..addAll(headers ?? {});

      if (kDebugMode && printLogRequestInfo) logRequestInfo(requestUrl: '${_dio.options.baseUrl}${path.asString}', type: type, data: data, pathSuffix: pathSuffix, headers: mergedHeaders, queryParameters: queryParameters);

      _dio.options = _dio.options.copyWith(connectTimeout: connectionTimeout, receiveTimeout: receiveTimeout, sendTimeout: sendTimeout, validateStatus: validateStatus);

      final response = await _dio.request<Map<String, dynamic>>(
        pathSuffix == null ? path.asString : '${path.asString}$pathSuffix',
        queryParameters: queryParameters?.toJson(),
        data: dioFormData ?? data?.toJson(),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: Options(
          method: type.asString,
          headers: mergedHeaders,
          contentType: contentType,
          responseType: responseType,
        ),
      );

    
      final responseTimeMilliseconds = DateTime.now().millisecondsSinceEpoch - startMs;

      if (kDebugMode && printLogResponseInfo) logResponseInfo(response: response, responseTime: responseTimeMilliseconds, requestUrl: '${_dio.options.baseUrl}${path.asString}');

      return getSuccessResponse<T, M>(
        response: response,
        responseEntityModel: responseEntityModel,
        hasBaseResponse: hasBaseResponse,
      );
    } catch (error) {
      final statusCode = error is DioException ? error.response?.statusCode : null;
      if (statusCode == 401) onUnauthorized(error as DioException);
      if (statusCode == 503) onServiceUnavailable(error as DioException);
      if (kDebugMode && printLogErrorResponseInfo) logErrorResponseInfo(statusCode: statusCode, error: error, requestUrl: '${_dio.options.baseUrl}${path.asString}');
      return getErrorResponse<T>(error: error);
    }
  }

  @override
  Future<FLBaseResponse> primitiveRequest<T>({
    required BaseRequestPath path,
    required RequestType type,
    BaseModel<dynamic>? data,
    FormData? dioFormData,
    BaseModel<dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? pathSuffix,
    String? contentType,
    ResponseType? responseType,
    CancelToken? cancelToken,
    ValidateStatus? validateStatus,
    Duration connectionTimeout = const Duration(seconds: 25),
    Duration receiveTimeout = const Duration(seconds: 25),
    Duration sendTimeout = const Duration(seconds: 25),
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
  final startMs = DateTime.now().millisecondsSinceEpoch;
    try {
     
      final mergedHeaders = generateHeaders(path: path)..addAll(headers ?? {});

      if (kDebugMode) {
        logRequestInfo(requestUrl: '${_dio.options.baseUrl}${path.asString}', type: type, data: data, pathSuffix: pathSuffix, headers: mergedHeaders, queryParameters: queryParameters);
      }
      _dio.options = _dio.options.copyWith(connectTimeout: connectionTimeout, receiveTimeout: receiveTimeout, sendTimeout: sendTimeout, validateStatus: validateStatus);

      final response = await _dio.request<T>(
        pathSuffix == null ? path.asString : '${path.asString}$pathSuffix',
        queryParameters: queryParameters?.toJson(),
        data: dioFormData ?? data?.toJson(),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: Options(
          method: type.asString,
          headers: mergedHeaders,
          contentType: contentType,
          responseType: responseType,
        ),
      );

      final responseTimeMilliseconds = DateTime.now().millisecondsSinceEpoch - startMs;
      if (kDebugMode) logResponseInfo(response: response, responseTime: responseTimeMilliseconds, requestUrl: '${_dio.options.baseUrl}${path.asString}');
      return getSuccessPrimitiveResponse(response: response);
    } catch (error) {
      final statusCode = error is DioException ? error.response?.statusCode : null;
      if (statusCode == 401) onUnauthorized(error as DioException);
      if (statusCode == 503) onServiceUnavailable(error as DioException);
      if (kDebugMode) logErrorResponseInfo(statusCode: statusCode, error: error, requestUrl: '${_dio.options.baseUrl}${path.asString}');
      return getErrorResponse<T>(error: error);
    }
  }

  @override
  Map<String, dynamic> generateHeaders({required BaseRequestPath path}) => {};

  @override
  void onUnauthorized(DioException error) {}

  @override
  void onServiceUnavailable(DioException error) {}
}
