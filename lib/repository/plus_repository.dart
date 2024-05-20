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

  Future<void> postCloudThinking(int thinkingId, String sentences) async {
    try{
      final response = await _dio.post("/api/thinkings/$thinkingId",
        data: {
          "sentences": [sentences], // sentences를 리스트 형태로 전달
        }
        );
      if (response.statusCode == 200) {
        //return HomeModel.fromJson(response.data);
      } else {
        // 서버에서 오류 응답을 받은 경우 처리
        throw Exception(
            'Failed to load editor news: ${response.statusMessage}');
      }
    } catch (e) {
      // 네트워크 오류 또는 기타 오류 처리
      throw Exception('Error occurred: $e');
    }
  }
}