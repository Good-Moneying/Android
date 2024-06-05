import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ShareRepository{
  final Dio _dio = Dio();

  ShareRepository(){
    _dio.options.baseUrl = dotenv.get("BASE_URL");
    _dio.options.validateStatus = (status){
      return status! < 500;
    };
  }

  //설문 api
  Future<void> survey() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await _dio.post(
          "/api/survey",
          options: Options(
              headers: {
                "Authorization": "Bearer ${prefs.getString('accessToken')}",
              }
          )
      );

      print('설문 test: ${response.statusCode}');

      if (response.statusCode == 200) {
        //설문 api 응답 성공

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