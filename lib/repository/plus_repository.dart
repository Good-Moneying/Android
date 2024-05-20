import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/plus/cloud_home_medel.dart';

class PlusRepository {
  final Dio _dio = Dio();

  ProfileRepository() {
    _dio.options.baseUrl = dotenv.get("BASE_URL");
    _dio.options.validateStatus = (status) {
      return status! < 500;
    };
  }

  Future<CloudHomeModel> getCloudHome() async {
    try {
      print('getCloudHome() 호출');
      final response = await _dio.get("/api/thinkings/home");

      if (response.statusCode == 200) {
        return CloudHomeModel.fromJson(response.data);
      } else {
        throw Exception(
            'cloudHomeGet 실패! : ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      print('오류 발생!: $e');
      throw Exception('Error occurred!!: $e');
    }
  }
}