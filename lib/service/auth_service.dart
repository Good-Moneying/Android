import 'package:flutter/cupertino.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

//로그인 플랫폼
enum LoginPlatform {
  kakao,
  none, // logout
}

// 로그인 시 받은 accessToken으로 ID 토큰을 얻어옴
Future<OAuthToken?> getOAuthToken() async {
  try {
    OAuthToken? token = await TokenManagerProvider.instance.manager.getToken();
    return token;
  } catch (e) {
    return null;
  }
}

// 만료된 ID 토큰을 갱신하는 함수
Future<OAuthToken> refreshOAuthToken() async {
  try {
    OAuthToken? token = await getOAuthToken();

    if (token != null) {
      return await AuthApi.instance.refreshToken(oldToken: token);
    } else {
      throw ("refreshToken is null");
    }
  } catch (e) {
    rethrow;
  }
}

//유저 정보 가져오기
void getKakaoUserInfo() async {
  try {
    User user = await UserApi.instance.me();
    print('사용자 정보 요청 성공'
        '\n회원번호: ${user.id}'
        '\n연령대: ${user.kakaoAccount?.ageRange}'
        '\n성별: ${user.kakaoAccount?.gender}');
  } catch (error) {
    print('사용자 정보 요청 실패 $error');
  }
}

//로그인
Future<void> kakaoLogin() async {
  if (await isKakaoTalkInstalled()) {
    try {
      await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공');
      // if (await isSignup(LoginPlatform.kakao,
      // await getOAuthToken().then((value) => value!.idToken!))) {
      //   홈화면 이동
      // } else {
      //   동의 화면 이동
      // }
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
        // if (await isSignup(LoginPlatform.kakao,
        //     await getOAuthToken().then((value) => value!.idToken!))) {
        //   홈화면 이동
        // } else {
        //   동의 화면 이동
        // }
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    try {
      await UserApi.instance.loginWithKakaoAccount();
      print('카카오계정으로 로그인 성공');
      // if (await isSignup(LoginPlatform.kakao,
      //     await getOAuthToken().then((value) => value!.idToken!))) {
      //   홈화면 이동
      // } else {
      //  동의 화면 이동
      // }
    } catch (error) {
      print('카카오계정으로 로그인 실패 $error');
    }
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