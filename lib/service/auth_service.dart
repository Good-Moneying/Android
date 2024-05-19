import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:meetup/view/bottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../routes/get_pages.dart';

//로그인 플랫폼
enum LoginPlatform {
  KAKAO,
  none, // logout
}

// 로그인 시 받은 accessToken 반환
Future<OAuthToken?> getOAuthToken() async {
  try {
    // OAuthToken? token = await TokenManagerProvider.instance.manager.getToken();
    OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
    return token;
  } catch (e) {
    return null;
  }
}

// // 만료된 ID 토큰을 갱신하는 함수
// Future<OAuthToken> refreshOAuthToken() async {
//   try {
//     OAuthToken? token = await getOAuthToken();
//
//     if (token != null) {
//       return await AuthApi.instance.refreshToken(oldToken: token);
//     } else {
//       throw ("refreshToken is null");
//     }
//   } catch (e) {
//     rethrow;
//   }
// }

//유저 정보 가져오기
void getKakaoUserInfo() async {
  try {
    User user = await UserApi.instance.me();
    print('사용자 정보 요청 성공'
        '\n회원번호: ${user.id}'
        '\n연령대: ${user.kakaoAccount?.email}'
        '\n성별: ${user.kakaoAccount?.gender}');
  } catch (error) {
    print('사용자 정보 요청 실패 $error');
  }
}

//로그인 요청 처리 및 성공 여부 반환
Future<bool> isSignup(LoginPlatform loginPlatform, String accessToken) async {
  try {
    print('issignup 진입');
    Dio dio = Dio();
    dio.options.baseUrl = dotenv.get("BASE_URL");
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    late Response response;
    switch (loginPlatform) {
      case LoginPlatform.KAKAO:
        print('case : kakao');
        response = await dio.get(
          "/api/oauth/KAKAO",
          queryParameters: {'prodiver':'kakao'},
          options: Options(
            headers: {
              'OAuth': accessToken,
            },
          ),
        );

        break;
      case LoginPlatform.none:
        break;
    }
    if (response.statusCode == 400) {
      print('BAD REQUEST');
    }
    if (response.statusCode == 200) {
      //응답 성공
      print('응답 성공');
      switch (loginPlatform) {
        case LoginPlatform.KAKAO:
          User user = await UserApi.instance.me();
          String? userEmail = user.kakaoAccount!.email;

          final prefs = await SharedPreferences.getInstance();
          prefs.setString('accessToken', response.data['accessToken']);

          prefs.setString('email', userEmail!);
          prefs.setString('refreshToken', response.data['refreshToken']);
          prefs.setString('provider', 'KAKAO');
          bool isRegistered = response.data['isRegistered'];

          if (isRegistered == true) {
            //홈 화면 고고
            print('가입된 유저입니다');
            return true;
          } else {
            //회원 가입 고고
            print('여기서 걸림');
            return false;
          }

        case LoginPlatform.none:
          break;
      }
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}

//로그인
Future<void> kakaoLogin() async {
  if (await isKakaoTalkInstalled()) {
    try {
      OAuthToken Token = await UserApi.instance.loginWithKakaoTalk();
      String myatoken = Token.accessToken;
      print('카카오톡으로 로그인 성공');
      print('accessToken : $myatoken');
      if (await isSignup(LoginPlatform.KAKAO, Token.accessToken)) {
        // 홈화면 이동
        Get.offAll(BottomNavigationView());
      } else {
        // 온보딩 화면 이동
        Get.toNamed(Routes.NICKNAME);
        print('처음 가입한 유저입니다.');
      }
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        OAuthToken Token = await UserApi.instance.loginWithKakaoAccount();
        String myatoken = Token.accessToken;
        // print('카카오톡으로 로그인 성공');
        print('accessToken : $myatoken');
        if (await isSignup(LoginPlatform.KAKAO, Token.accessToken)) {
          // 홈화면 이동
          Get.offAll(BottomNavigationView());
        } else {
          // 온보딩 화면 이동
          Get.toNamed(Routes.NICKNAME);
        }
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    try {
      OAuthToken Token = await UserApi.instance.loginWithKakaoAccount();
      String myatoken = Token.accessToken;
      // print('카카오톡으로 로그인 성공');
      print('accessToken : $myatoken');
      if (await isSignup(LoginPlatform.KAKAO, Token.accessToken)) {
        // 홈화면 이동
        Get.offAll(BottomNavigationView());
      } else {
        // 온보딩 화면 이동
        Get.toNamed(Routes.NICKNAME);
      }
    } catch (error) {
      print('카카오계정으로 로그인 실패 $error');
    }
  }
}

//온보딩 진행 후 회원가입 데이터 전송
Future<void> onboarding(final formData) async {
  try {
    Dio dio = Dio();
    dio.options.baseUrl = dotenv.get("BASE_URL");
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    Response response;

    response = await dio.post(
      "/api/users",
      options: Options(headers: {
        Headers.acceptHeader: 'application/json',
        Headers.contentTypeHeader: 'application/json'
      }),
      data: formData,
    );
    print(response.statusCode);


    if (response.statusCode == 400) {
      print('BAD REQUEST');
    }
    if (response.statusCode == 200) {
      print('유저 정보 전송 성공');
    }
  } catch (e) {
    print(e);
  }
}

//로그아웃
Future<void> signOut(BuildContext context) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', false);
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);

    await UserApi.instance.logout();
  } catch (error) {
    print('카카오계정으로 로그인 아웃 실패 $error');
  }
}

////oauth test 함수
// Future<void> test(String accessToken) async {
//   try{
//     Dio dio = Dio();
//     dio.options.baseUrl = dotenv.get("BASE_URL");
//     dio.options.headers['Authorization'] = 'Bearer $accessToken';
//     dio.options.validateStatus = (status) {
//       return status! < 500;
//     };
//     Response response;
//
//     response = await dio.get(
//       '/api/oauth/test'
//     );
//
//     if(response.statusCode ==200){
//       print('test 코드 출력 성공');
//     }
//     else {
//       print('test 실패');
//       print(response.statusCode);
//     }
//   }
//   catch (e) {
//
//   }
// }

//닉네임 중복 확인
Future<bool> isDuplicate(String value) async {
  try {
    Dio dio = Dio();
    dio.options.baseUrl = dotenv.get("BASE_URL");
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    Response response;

    response = await dio.post(
      '/api/users/validate/nickname',
      options: Options(headers: {
        Headers.contentTypeHeader: 'application/json'
      }),
      data: {
        'nickname': value
      },
    );
    print(response.statusCode);

    if (response.statusCode == 409) {
      print('이미 존재하는 닉네임입니다.');
      return true;
    }
    if (response.statusCode == 200) {
      print('사용 가능한 닉네임입니다.');
      return false;
    }
    return true;
  } catch (e) {
    print(e);
    return true;
  }
}
