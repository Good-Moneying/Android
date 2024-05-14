import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    try {
      print('getProfileData() 호출');
      final response = await _dio.get("/api/users/mypage/test");

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
    try {
      print('getTermData() 호출');
      final response = await _dio.get("/api/archives/terms/test");

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

  Future<ArchivesNewsLetterModel> getNewsLetterData() async {
    try {
      print('getNewsLetterData() 호출');
      final response = await _dio.get("/api/archives/newsletters/{category}/test", queryParameters: {'category' : ''});

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