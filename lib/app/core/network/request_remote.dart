import 'package:dio/dio.dart';

import '../error/exception/server_exception.dart';

Future<dynamic> hitAPI(Future<Response> Function() computation) async {
  try {
    final response = await computation();
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return response.data;
    } else {
      throw ServerException(response);
    }
  } on DioException catch (e) {
    throw ServerException(e);
  }
}
