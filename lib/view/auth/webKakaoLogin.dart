import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meetup/view/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;


class WebKakaoLogin extends StatefulWidget {
  const WebKakaoLogin({super.key});

  @override
  State<WebKakaoLogin> createState() => _WebKakaoLoginState();
}

class _WebKakaoLoginState extends State<WebKakaoLogin> {
  late WebViewController _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse('https://goodmoneying.shop/oauth/kakao'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) async {

          if (request.url.startsWith('https://')) {

            String code = Uri.parse(request.url).queryParameters['code'] ?? '';

            var response = await http.get(
              Uri.parse("https://"),
            );

            var parsedResponse = jsonDecode(response.body);

            if (response.statusCode == 200) {
              String accessToken =
              parsedResponse['data']['jwt']['access_token'];
              String refreshToken =
              parsedResponse['data']['jwt']['refresh_token'];

              //토큰 저장
              const storage = FlutterSecureStorage();
              await storage.write(key: 'accessToken', value: accessToken);
              await storage.write(key: 'refreshToken', value: refreshToken);

              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('isLogged', true);
              //로그인 성공하면 홈화면 이동
              Get.offAll(const HomeScreen());
            } else {
              //로그인 실패
              print('Login error');
            }
          }
          return NavigationDecision.navigate;
        },
      ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kakao Login'),
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
