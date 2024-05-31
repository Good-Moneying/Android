import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meetup/view/auth/frequency_screen.dart';
import 'package:meetup/view/auth/info_screen.dart';
import 'package:meetup/view/auth/login_screen.dart';
import 'package:meetup/view/auth/nickname_screen.dart';
import 'package:meetup/view/bottomNavigationBar.dart';
import 'package:meetup/view/home/home_screen.dart';
import 'package:meetup/view/home/live_news_screen.dart';
import 'package:meetup/view/home/news_letter_screen.dart';
import 'package:meetup/view/home/today_term_screen.dart';
import 'package:meetup/view/mypage/profile_screen.dart';
import 'package:meetup/view/plus/plus_complete_screen.dart';
import 'package:meetup/view/plus/plus_onboarding_screen.dart';
import 'package:meetup/view/plus/plus_screen.dart';
import 'package:meetup/view/plus/plus_step1_screen.dart';
import 'package:meetup/view/plus/plus_think_storage.dart';
import 'binding/settings_binding.dart';
import 'routes/get_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  KakaoSdk.init(nativeAppKey: "${dotenv.env['YOUR_NATIVE_APP_KEY']}");

  //로그인 여부 확인
  bool isLogin = false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      title: 'Good Moneying',
      // theme: ThemeData(
      //
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      initialBinding: SettingsBinding(),
      home: LoginScreen(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
      ],
      getPages: Pages.pages,
    );
  }
}
