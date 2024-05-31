import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meetup/model/plus/cloud_sentences_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/plus/cloud_specific_model.dart';
import '../model/plus/plus_comment_model.dart';
import '../model/plus/cloud_home_medel.dart';

class PlusRepository {
  final Dio _dio = Dio();

  PlusRepository() {
    _dio.options.baseUrl = dotenv.get("BASE_URL");
    _dio.options.validateStatus = (status) {
      return status! < 500;
    };
  }

  Future<CloudHomeModel> getCloudHome() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      print('getCloudHome() 호출');
      final response = await _dio.get("/api/thinkings/home",
          options: Options(headers: {
            "Authorization": "Bearer ${prefs.getString('accessToken')}",
            }));

      if (response.statusCode == 200) {
        print('성공티비');
        print('구름홈 : ${response.data}');
        return CloudHomeModel.fromJson(response.data);
      } else {
        throw Exception(
            'cloudHomeGet 실패! : ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('cloudHomeGet 오류 발생!: DioException [${e.type}]: ${e.message}');
        print('응답 데이터: ${e.response?.data}');
        print('응답 헤더: ${e.response?.headers}');
        print('요청 옵션: ${e.response?.requestOptions}');
        throw Exception(
            'Error occurred!!: DioException [${e.type}]: ${e.message}');
      } else {
        print('cloudHomeGet 오류 발생!: DioException [${e.type}]: ${e.message}');
        throw Exception(
            'Error occurred!!: DioException [${e.type}]: ${e.message}');
      }
    } catch (e) {
      print('cloudHomeGet 예기치 않은 오류 발생!: $e');
      throw Exception('Unexpected error occurred!!: $e');
    }
  }

  Future<void> postCloudThinking(
      int thinkingId, List<CloudSentenceModel> sentences) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      // CloudSentenceModel 리스트에서 sentence 필드만 추출하여 문자열 리스트로 변환
      List<String> sentenceStrings =
          sentences.map((sentence) => sentence.sentence).toList();

      // 요청 데이터 출력
      print('요청 데이터: ${sentenceStrings.toString()}');

      final response = await _dio.post("/api/thinkings/$thinkingId",
          data: {
            "sentences": sentenceStrings, // 문자열 리스트 전달
          },
          options: Options(headers: {
            "Authorization": "Bearer ${prefs.getString('accessToken')}",
            }));

      if (response.statusCode != 201) {
        throw Exception(
            'Failed to post data!: ${response.statusCode} - ${response.statusMessage}');
      } else {
        print('post 성공티비');
      }
    } catch (e) {
      print('post Error occurred!: $e');
      throw Exception('post Error occurred!: $e');
    }
  }

  Future<String> postSummaryRequired(PlusCommentModel dataModel) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await _dio.post(
        "/api/thinkings/summary",
        data: dataModel.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer ${prefs.getString('accessToken')}",
          },
        ),
      );

      if (response.statusCode == 200) {
        print('post 성공!!!!');
        print('post!! ${response.data}');
        return response.data; // 응답 데이터를 반환
      } else {
        throw Exception('postSummaryRequired 실패! : ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('postSummaryRequired 오류 발생!: DioException [${e.type}]: ${e.message}');
        print('응답 데이터: ${e.response?.data}');
        print('응답 헤더: ${e.response?.headers}');
        print('요청 옵션: ${e.response?.requestOptions}');
        throw Exception('Error occurred!!: DioException [${e.type}]: ${e.message}');
      } else {
        print('postSummaryRequired 오류 발생!: DioException [${e.type}]: ${e.message}');
        throw Exception('Error occurred!!: DioException [${e.type}]: ${e.message}');
      }
    } catch (e) {
      print('postSummaryRequired 예기치 않은 오류 발생!: $e');
      throw Exception('Unexpected error occurred!!: $e');
    }
  }

  Future<CloudSpecificModel> getCloudSpecific(int thinkingId) async{
    final prefs = await SharedPreferences.getInstance();

    try {
      print('getCloudSpecific() 호출');
      final response = await _dio.get(
          "/api/thinkings/$thinkingId",
          options: Options(
              headers: {
                "Authorization": "Bearer ${prefs.getString('accessToken')}",
                //"Authorization": "Bearer ${'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdWh5dW4xMDIwMUBuYXZlci5jb20iLCJpc3MiOiJkdWR1ay5zaG9wIiwiZXhwIjoxNzE2MjE4NTI1LCJpYXQiOjE3MTYyMTQ5MjV9.2stKXh7wYegZ8qgLpSwz5RF2OCIyPYrI7mB1vS9vxSQ'}",
              }
          )
      );

      print('구름온보딩 통신테스트');
      print(response.statusCode);

      if (response.statusCode == 200) {
        print("구름온보딩 성공");
        print('구름온보딩 : ${response.data}');
        return CloudSpecificModel.fromJson(response.data);
      } else {
        // 서버에서 오류 응답을 받은 경우 처리
        throw Exception(
            'Failed to load cloud onboarding: ${response.statusCode}');
      }
    } catch (e) {
      // 네트워크 오류 또는 기타 오류 처리
      throw Exception('Error occurred: $e');
    }
  }

}
