import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/share/detail_survey_model.dart';
import '../model/share/today_survey_model.dart';


class ShareRepository{
  final Dio _dio = Dio();

  ShareRepository(){
    _dio.options.baseUrl = dotenv.get("BASE_URL");
    _dio.options.validateStatus = (status){
      return status! < 500;
    };
  }

  //오늘의 설문
  Future<TodaySurveyModel> todaySurvey() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await _dio.get(
          "/api/surveys",
          options: Options(
              headers: {
                "Authorization": "Bearer ${prefs.getString('accessToken')}",
              }
          )
      );

      print('오늘의 설문 test: ${response.statusCode}');

      if (response.statusCode == 200) {
        //설문 api 응답 성공
        print('오늘의 설문 : ${response.data}');
        return TodaySurveyModel.fromJson(response.data);
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

  //설문 상세보기
  Future<DetailSurveyModel> detailSurvey(int id) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await _dio.get(
          "/api/surveys/$id",
          options: Options(
              headers: {
                "Authorization": "Bearer ${prefs.getString('accessToken')}",
              }
          )
      );

      print('설문 상세 test: ${response.statusCode}');

      if (response.statusCode == 200) {
        //설문 api 응답 성공
        print('설문 상세 : ${response.data}');
        return DetailSurveyModel.fromJson(response.data);
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

  //찬성
  Future<void> agree(int id) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await _dio.post(
          "/api/surveys/agree",
          queryParameters: {'surveyId': '$id'},
          options: Options(
              headers: {
                "Authorization": "Bearer ${prefs.getString('accessToken')}",
              }
          ),
      );

      print('설문 찬성 test: ${response.statusCode}');

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

  //반대
  Future<void> disagree(int id) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await _dio.post(
        "/api/surveys",
        queryParameters: {'surveyId': '$id'},
        options: Options(
            headers: {
              "Authorization": "Bearer ${prefs.getString('accessToken')}",
            }
        ),
      );

      print('설문 반대 test: ${response.statusCode}');

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