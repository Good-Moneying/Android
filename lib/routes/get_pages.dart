import 'package:get/get.dart';
import 'package:meetup/binding/share_binding.dart';

import 'package:meetup/view/auth/frequency_screen.dart';
import 'package:meetup/view/auth/info_screen.dart';
import 'package:meetup/view/auth/interest_screen.dart';
import 'package:meetup/view/auth/login_screen.dart';
import 'package:meetup/view/auth/welcome_screen.dart';
import 'package:meetup/view/home/all_live_screen.dart';
import 'package:meetup/view/home/home_screen.dart';
import 'package:meetup/view/home/live_news_screen.dart';
import 'package:meetup/view/home/news_letter_screen.dart';
import 'package:meetup/view/home/today_term_screen.dart';
import 'package:meetup/view/plus/plus_screen.dart';
import 'package:meetup/view/mypage/profile_screen.dart';
import 'package:meetup/view/share/add_survey_screen.dart';
import 'package:meetup/view/share/quiz/one_quiz_screen.dart';
import 'package:meetup/view/share/quiz/result_quiz_screen.dart';
import 'package:meetup/view/share/quiz/two_quiz_screen.dart';
import 'package:meetup/view/share/share_screen.dart';
import 'package:meetup/view/share/survey_screen.dart';
import 'package:meetup/viewModel/user_viewModel.dart';

import '../binding/settings_binding.dart';
import '../view/auth/nickname_screen.dart';
import '../view/bottomNavigationBar.dart';

part './get_routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.NICKNAME,
      page: () => NicknameScreen(),
      // binding: BindingsBuilder(() {
      //   Get.put(UserViewModel());
      // }
      //),
    ),
    GetPage(
      name: Routes.INFO,
      page: () => InfoScreen(),
      binding: BindingsBuilder(() {
        Get.put(UserViewModel());
      }),
    ),
    GetPage(
      name: Routes.INTEREST,
      page: () => InterestScreen(),
      binding: BindingsBuilder(() {
        Get.put(UserViewModel());
      }),
    ),
    GetPage(
      name: Routes.FREQUENCY,
      page: () => FrequencyScreen(),
      binding: BindingsBuilder(() {
        Get.put(UserViewModel());
      }),
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
      name: Routes.PLUS,
      page: () => PlusScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: Routes.EDITORNEWS,
      page: () => NewsLetterScreen(),
      binding: BindingsBuilder(() {
        SettingsBinding().dependencies();
      }),
    ),
    GetPage(
      name: Routes.LIVE,
      page: () => LiveNewsScreen(),
      binding: BindingsBuilder(() {
        SettingsBinding().dependencies();
      }),
    ),
    GetPage(
      name: Routes.ALLLIVE,
      page: () => AllLiveScreen(),
    ),
    GetPage(
      name: Routes.TODAYTERM,
      page: () => TodayTermScreen(),
    ),
    GetPage(
      name: Routes.SHARE,
      page: () => ShareScreen(),
      binding: ShareBinding(),
    ),
    GetPage(
      name: Routes.SURVEY,
      page: () => SurveyScreen(),
    ),
    GetPage(
      name: Routes.ADDSURVEY,
      page: () => AddSurveyScreen(),
    ),
    GetPage(
      name: Routes.FIRSTQUIZ,
      page: () => OneQuizScreen(),
    ),
    GetPage(
      name: Routes.SECONDQUIZ,
      page: () => TwoQuizScreen(),
    ),
    GetPage(
      name: Routes.RESULTQUIZ,
      page: () => ResultQuizScreen(),
    ),
  ];
}
