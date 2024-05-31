import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/FontStyles.dart';
import 'package:meetup/view/home/home_screen.dart';
import 'package:meetup/view/home/news_letter_screen.dart';
import 'package:meetup/view/plus/plus_screen.dart';
import 'package:meetup/view/mypage/profile_screen.dart';
import 'package:meetup/view/share/share_screen.dart';
import 'package:meetup/viewModel/app_viewModel.dart';
import 'package:lottie/lottie.dart';
import '../design/style/ColorStyles.dart';

//GetView<AppViewModel> 을 상속받아 좀 더 쓰기 쉽게 함
class BottomNavigationView extends GetView<AppViewModel> {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppViewModel());
    int initialIndex = Get.arguments ?? 0; // Get.arguments로 전달된 인덱스 받기, 없으면 0
    controller.changeCurrentIndex(initialIndex);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: null,
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }

  Widget _bodyWidget() {
    return Obx(() {
      switch (controller.currentIndex.value) {
        case 0:
          return HomeScreen();
        case 1:
          return PlusScreen();
        case 2:
          return ShareScreen();
        case 3:
          return ProfileScreen();
        default:
          return Container();
      }
    });
  }

  Widget _bottomNavigationBarWidget() {
    return Obx(
          () => Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            print('selectedIdx: $index');
            controller.rememberPreviousIndex();
            controller.changeCurrentIndex(index);
          },
          currentIndex: controller.currentIndex.value,
          selectedLabelStyle: FontStyles.Caption2_m.copyWith(color: AppColors.g6),
          unselectedLabelStyle: FontStyles.Caption2_m.copyWith(color: AppColors.g6),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home_unfill.svg'),
              activeIcon: Lottie.asset('assets/lottie/MAIN_new.json', width: 24, height: 24, repeat: false),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/plus_unfill.svg'),
              activeIcon: Lottie.asset('assets/lottie/Plus_new.json', width: 24, height: 24, repeat: false),
              label: '생각더하기',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/divide_unfill.svg'),
              activeIcon: Lottie.asset('assets/lottie/divide_new.json', repeat: false),
              label: '생각나누기',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/profile_unfill.svg'),
              activeIcon: Lottie.asset('assets/lottie/MY_new.json', width: 24, height: 24, repeat: false),
              label: '마이페이지',
            ),
          ],
        ),
      ),
    );
  }
}
