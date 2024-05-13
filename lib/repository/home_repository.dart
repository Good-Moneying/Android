import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/news_letter_model.dart';

class HomeRepository {
  final Dio _dio = Dio();

  HomeRepository() {
    _dio.options.baseUrl = dotenv.get("BASE_URL");
    _dio.options.validateStatus = (status) {
      return status! < 500;
    };
  }

  Future<NewsLetterModel> getEditorNews() async {
    try {
      print('getEditorNews() 호출');
      final response = await _dio.get("/api/newsletters/test");

      if (response.statusCode == 200) {
        return NewsLetterModel.fromJson(response.data);
      } else {
        // 서버에서 오류 응답을 받은 경우 처리
        throw Exception('Failed to load editor news: ${response.statusMessage}');
      }
    } catch (e) {
      // 네트워크 오류 또는 기타 오류 처리
      throw Exception('Error occurred: $e');
    }
  }
}