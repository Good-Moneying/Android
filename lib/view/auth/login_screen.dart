import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/view/home/home_screen.dart';
import '../../design/widgets/login_button.dart';
import '../../service/auth_service.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animationOffset;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // 애니메이션 지속 시간 설정
    );

    // Tween을 사용하여 애니메이션 범위 설정
    _animationOffset = Tween<Offset>(
      begin: Offset(0.0, 0.0), // 시작 위치
      end: Offset(0.0, 10.0), // 종료 위치 (위로 이동)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut, // 애니메이션 곡선 설정
    ));

    // 애니메이션 반복 설정
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              AnimatedBuilder(
                animation: _animationOffset,
                builder: (context, child) {
                  return Transform.translate(
                    offset: _animationOffset.value,
                    child: SvgPicture.asset(
                      'assets/icons/login_balloon.svg',
                    ),
                  );
                },
              ),
              const LoginButton(
                backgroundColor: Color(0xFFFEE500),
                icon: "assets/icons/kakao.svg",
                label: 'Kakao로 시작하기',
                onTap: kakaoLogin, //webSignIn(),
              ),
              SizedBox(
                height: Get.height * 0.12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // 애니메이션 컨트롤러 해제
    super.dispose();
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
