import 'package:get/get.dart';

import 'package:meetup/service/auth_service.dart';
import 'package:meetup/view/auth/frequency_screen.dart';
import 'package:meetup/view/auth/info_screen.dart';
import 'package:meetup/view/auth/interest_screen.dart';
import 'package:meetup/view/auth/login_screen.dart';
import 'package:meetup/view/auth/webKakaoLogin.dart';
import 'package:meetup/view/auth/welcome_screen.dart';
import 'package:meetup/view/home/home_screen.dart';
import 'package:meetup/view/investment/investment_screen.dart';
import 'package:meetup/view/mypage/profile_screen.dart';
import 'package:meetup/view/search/search_screen.dart';

import '../view/auth/nickname_screen.dart';
import '../view/bottomNavigationBar.dart';

part './get_routes.dart';

class Pages {
  static final pages = [
    GetPage(
        name: Routes.LOGIN,
        page: () => loginScreen(),
    ),
    GetPage(
        name: Routes.KAKAOLOGIN,
        page: () => WebKakaoLogin(),
    ),
    GetPage(
      name: Routes.NICKNAME,
      page: () => NicknameScreen(),
    ),
    GetPage(
      name: Routes.INFO,
      page: () => InfoScreen(),
    ),
    GetPage(
      name: Routes.INTEREST,
      page: () => InterestScreen(),
    ),
    GetPage(
      name: Routes.FREQUENCY,
      page: () => FrequencyScreen(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => BottomNavigationView(),
    ),
    GetPage(
      name: Routes.INVEST,
      page: () => InvestScreen(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchScreen(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileScreen(),
    ),

  ];
}
