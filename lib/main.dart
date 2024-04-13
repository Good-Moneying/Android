import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meetup/view/login/login_screen.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  KakaoSdk.init(nativeAppKey: "${dotenv.env['YOUR_NATIVE_APP_KEY']}");

  //로그인 여부 확인
  bool isLogin = false;

  print('카카오 해시키 : ${await KakaoSdk.origin}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: loginScreen(),
    );
  }
}