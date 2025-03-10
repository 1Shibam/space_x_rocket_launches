import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:space_x_rocket_launches/models/launches_data_model.dart';
import 'package:space_x_rocket_launches/models/rockets_data_model.dart';

class SpaceXServices {
  final Dio dio = Dio(BaseOptions(
      baseUrl: dotenv.env['API_END_POINT']!,
      receiveTimeout: const Duration(seconds: 5),
      connectTimeout: const Duration(seconds: 5)));

  Future<List<LaunchesDataModel>> getLaunchesList() async {
    try {
      final response = await dio.get('/launches');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        final result =
            data.map((json) => LaunchesDataModel.fromJson(json)).toList();

        return result;
      } else {
        throw Exception('Failed to fetch Rockets: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RocketsDataModel>> getRocketsList() async {
    try {
      final response = await dio.get('/rockets');

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(response.data);

        final result =
            data.map((json) => RocketsDataModel.fromJson(json)).toList();

        return result;
      } else {
        throw Exception('Failed to fetch Rockets: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
