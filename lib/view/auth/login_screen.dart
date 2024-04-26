import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:meetup/view/home/home_screen.dart';
import 'package:meetup/view/auth/webKakaoLogin.dart';
import '../../design/style/ColorStyles.dart';
import '../../design/widgets/login_button.dart';
import '../../service/auth_service.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인 화면'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginButton(
              backgroundColor: Color(0xFFFEE500),
              textColor: Colors.black87,
              icon: "assets/icons/kakao.svg",
              label: '카카오 로그인',
              onTap: kakaoLogin, //webSignIn(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> webSignIn() async {
    // 고유한 redirect uri
    final redirect_uri = dotenv.get("BASE_URL");

    // 백엔드에서 미리 작성된 API 호출
    final url = Uri.parse('/login/naver?redirect-uri=${redirect_uri}');

    //final url = Uri.parse('oauth/kakao');

    // 백엔드가 제공한 로그인 페이지에서 로그인 후 callback 데이터 반환
    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: HomeScreen().toString());

    // 백엔드에서 redirect한 callback 데이터 파싱
    final accessToken = Uri.parse(result).queryParameters['access-token'];
    final refreshToken = Uri.parse(result).queryParameters['refresh-token'];

    print(accessToken);
    print(refreshToken);

    // . . .
    // FlutterSecureStorage 또는 SharedPreferences 를 통한
    // Token 저장 및 관리
    await saveTokens(accessToken!, refreshToken!);
  }

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'accessToken', value: accessToken);
    await storage.write(key: 'refreshToken', value: refreshToken);
  }
}
