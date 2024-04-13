import 'package:flutter/material.dart';
import 'package:meetup/design/widgets/login_button.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:meetup/service/auth_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(nativeAppKey: "${dotenv.env['YOUR_NATIVE_APP_KEY']}");

  print('카카오 해시키 : ${await KakaoSdk.origin}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //로그인 버튼 실험
            const LoginButton(
              backgroundColor: AppColors.auth,
              textColor: Colors.black87,
              icon: "assets/icons/kakao.svg",
              label: '카카오 로그인',
              onTap: kakaoLogin,
            ),
          ],
        ),
      ),
    );
  }
}
