import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/home/home_model.dart';
import '../model/home/news_letter_model.dart';

class HomeRepository {
  final Dio _dio = Dio();


  HomeRepository() {
    _dio.options.baseUrl = dotenv.get("BASE_URL");
    _dio.options.validateStatus = (status) {
      return status! < 500;
    };
  }

  Future<NewsLetterModel> getEditorNews(int newsId) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      print('getEditorNews() 호출');
      final response = await _dio.get(
          "/api/newsletters/$newsId",
          options: Options(
              headers: {
                "Authorization": "Bearer ${prefs.getString('accessToken')}",
                //"Authorization": "Bearer ${'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdWh5dW4xMDIwMUBuYXZlci5jb20iLCJpc3MiOiJkdWR1ay5zaG9wIiwiZXhwIjoxNzE2MjE4NTI1LCJpYXQiOjE3MTYyMTQ5MjV9.2stKXh7wYegZ8qgLpSwz5RF2OCIyPYrI7mB1vS9vxSQ'}",
              }
          )
      );

      print('뉴스레터 통신테스트');
      print(response.statusCode);

      if (response.statusCode == 200) {
        print("뉴스레터 성공");
        print('뉴스레터 : ${response.data}');
        return NewsLetterModel.fromJson(response.data);
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

  Future<HomeModel> getHomeModel() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      print('getHomeModel() 호출');
      final response = await _dio.get(
        "/api/users/home",
        options: Options(
          headers: {
            "Authorization": "Bearer ${prefs.getString('accessToken')}",
          }
        )

      );

      if (response.statusCode == 200) {
        // print('홈모델 응답 성공');
        // print(HomeModel.fromJson(response.data));
        print('투데이뉴스 : ${response.data}');
        return HomeModel.fromJson(response.data);
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

  Future<void> postComment(int newsId, String content, String perspective) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await _dio.post(
          "/api/comments/$newsId",
        data: {
          "content": content,
          "perspective": perspective,
          "isPrivate": false
        },
        options: Options(
          headers: {
            "Authorization": "Bearer ${prefs.getString('accessToken')}",
          },
        ),
      );

      print('post 오류 확인');
      print(response.statusCode);

      if (response.statusCode == 200) {
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

  Future<void> archivesTerm(int termId) async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('accessToken'));
    try {
      final response = await _dio.post(
          "/api/archives/terms/$termId",
          options: Options(
              headers: {
                "Authorization": "Bearer ${prefs.getString('accessToken')}",
              }
          )
      );

      print(response.statusCode);

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

  Future<void> archivesNews(int newsId) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await _dio.post(
          "/api/archives/newsletters/$newsId",
          options: Options(
              headers: {
                "Authorization": "Bearer ${prefs.getString('accessToken')}",
              }
          )
      );

      print('archives 상태코드');
      print(response.statusCode);

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
