import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SpaceXServices {
  final Dio dio = Dio(BaseOptions(
    baseUrl: dotenv.env['API_END_POINT']!,
    receiveTimeout: const Duration(seconds: 5),
    connectTimeout: const Duration(seconds: 5)
  ));
}
