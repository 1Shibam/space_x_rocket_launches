import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:space_x_rocket_launches/models/launches_data_model.dart';


class SpaceXServices {
  final Dio dio = Dio(BaseOptions(
      baseUrl: dotenv.env['API_END_POINT']!,
      receiveTimeout: const Duration(seconds: 5),
      connectTimeout: const Duration(seconds: 5)));

  Future<List<LaunchesDataModel>> getLaunchesList() async {
    try {
      final respone = await dio.get('/launches');
      if (respone.statusCode == 200) {
        final List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(respone.data);
        print(data);
        final result =
            data.map((json) => LaunchesDataModel.fromJson(json)).toList();
        return result;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
