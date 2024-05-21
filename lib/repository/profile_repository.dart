import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/mypage/archives_news_letter_model.dart';
import '../model/mypage/archives_term_model.dart';
import '../model/mypage/profile_model.dart';

class ProfileRepository{
  final Dio _dio = Dio();
  
  ProfileRepository(){
    _dio.options.baseUrl = dotenv.get("BASE_URL");
    _dio.options.validateStatus = (status){
      return status! < 500;
    };
  }

  Future<ProfileModel> getProfileData() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      print('getProfileData() 호출');
      final response = await _dio.get("/api/users/mypage",
          options: Options(
              headers: {
                "Authorization": "Bearer ${prefs.getString('accessToken')}",
                //"Authorization": "Bearer ${'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdWh5dW4xMDIwMUBuYXZlci5jb20iLCJpc3MiOiJkdWR1ay5zaG9wIiwiZXhwIjoxNzE2MjE4NTI1LCJpYXQiOjE3MTYyMTQ5MjV9.2stKXh7wYegZ8qgLpSwz5RF2OCIyPYrI7mB1vS9vxSQ'}",
              }
          )
      );

      print('마이페이지 테스트');
      print(response.statusCode);
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw Exception('마이페이지 실패! : ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      print('오류 발생!: $e');
      throw Exception('Error occurred!!: $e');
    }
  }

  Future<ArchivesTermModel> getTermData() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      print('getTermData() 호출');
      final response = await _dio.get("/api/archives/terms",
          options: Options(
              headers: {
                "Authorization": "Bearer ${prefs.getString('accessToken')}",
              }
          )
      );

      print('아카이브 단어 테스트');
      print(response.statusCode);
      if (response.statusCode == 200) {
        return ArchivesTermModel.fromJson(response.data);
      } else {
        throw Exception('failed!! : ${response.statusCode} - ${response.statusMessage}');
        
      }
    } catch (e) {
      if (e is DioError) {
        final errorResponse = e.response;
        if (errorResponse != null) {
          print('서버 응답 코드: ${errorResponse.statusCode}');
          print('서버 응답 메시지: ${errorResponse.statusMessage}');
          print('서버 응답 데이터: ${errorResponse.data}');
        }
      }
      print('오류 발생!!: $e');
      throw Exception('error! : $e');
    }
  }

  Future<ArchivesNewsLetterModel> getNewsLetterData(String category) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      print('getNewsLetterData() 호출');
      final response = await _dio.get("/api/archives/newsletters/$category",
          options: Options(
              headers: {
                "Authorization": "Bearer ${prefs.getString('accessToken')}",
              }
          )
      );

      print('아카이브 뉴스 테스트');
      print(response.statusCode);
      if (response.statusCode == 200) {
        return ArchivesNewsLetterModel.fromJson(response.data);
      } else {
        throw Exception('마이페이지 실패!!! : ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      print('오류 발생!!!: $e');
      throw Exception('Error occurred!!!: $e');
    }
  }

}