import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    try{
      print('getProfileData() 호출');
      final response = await _dio.get("/api/users/mypage");

      if(response.statusCode == 200){
        return ProfileModel.fromJson(response.data);
      } else{
        throw Exception('마이페이지 실패 : ${response.statusMessage}' );
      }
    } catch(e){
      throw Exception('Error occurred: $e');
    }
  }
}