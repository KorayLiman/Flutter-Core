import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flcore/flcore.dart';

mixin class RequestLoggerMixin {
final _logger = FLLogger();

  void logRequestInfo({
    required String requestUrl,
    required RequestType type,
    BaseModel<dynamic>? data,
    FormData? dioFormData,
    BaseModel<dynamic>? queryParameters,
    String? pathSuffix,
    Map<String, dynamic>? headers,
  }) {
    final queryParamatersMap = queryParameters?.toJson();
    final queryParamatersString = queryParamatersMap?.keys.map((key) => '&$key=${queryParamatersMap[key]}').join() ?? '';

    final requestLog = """
REQUEST
->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->
Request Url: $requestUrl${pathSuffix ?? ''}$queryParamatersString,
Method: ${type.name}
DateTime: ${DateTime.now().toIso8601String()}
Request Data: ${jsonEncode(data?.toJson(), toEncodable: (Object? unEncodable) => "Unencodable value of type ->${unEncodable.runtimeType}<-")}
Request DioFormData: ${dioFormData?.fields} ${dioFormData?.files}
Headers: $headers
->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->""";
    _logger.log(requestLog, color: LogColors.yellow);
  }

  void logResponseInfo({
    required Response<dynamic> response,
    required int responseTime,
    required String requestUrl,
  }) {
    final responseLog = """
RESPONSE
<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-
Request Url: $requestUrl
DateTime: ${DateTime.now().toIso8601String()}
Response Time: $responseTime milliseconds
Headers: ${response.requestOptions.headers}
Response Status Code: ${response.statusCode}
Response Status Message: ${response.statusMessage ?? "null"}
Response Data: ${jsonEncode(response.data, toEncodable: (Object? unEncodable) => "Unencodable value of type ->${unEncodable.runtimeType}<-")}
<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-""";
    _logger.log(responseLog);
  }

  void logErrorResponseInfo({required int? statusCode, required Object error, required String requestUrl}) {
    final errorResponseLog = '''
REQUEST ERROR
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Status Code: $statusCode
Request Url: $requestUrl
Error String: $error
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX''';
    _logger.log(errorResponseLog, color: LogColors.red);
  }
}
