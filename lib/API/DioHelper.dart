import 'package:dio/dio.dart';
import 'package:fetch_data_dio/API/Constants.dart';

Dio DioHelper() {
  Dio dio = Dio();

  dio.options.receiveTimeout = 4000;
  dio.options.connectTimeout = 4000;
  dio.options.baseUrl = Constant.baseUrl;
  dio.interceptors.add(dioLoggerInterceptor);

  return dio;
}


final dioLoggerInterceptor =
InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
  String headers = "";
  options.headers.forEach((key, value) {
    headers += "| $key: $value";
  });
  print(
      "┌------------------------------------------------------------------------------");
  print('''| [DIO] Request: ${options.method} ${options.uri}
| ${options.data.toString()}
| Headers:\n$headers''');
  print(
      "├------------------------------------------------------------------------------");
  handler.next(options); //continue
}, onResponse: (Response response, handler) async {
  print(
      "| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}");
  print(
      "└------------------------------------------------------------------------------");
  handler.next(response);
  // return response; // continue
}, onError: (DioError error, handler) async {
  print("| [DIO] Error: ${error.error}: ${error.response?.toString()}");
  print(
      "└------------------------------------------------------------------------------");
  handler.next(error); //continue
});

