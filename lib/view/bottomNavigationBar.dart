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
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    //의존성 주입
    //lazyPut -> Obx로 감싼 부분 눌렀을시에 의존성 주입
    //이동시 바로 의존성이 주입되는 Get.put과는 다름
    Get.lazyPut(() => AppViewModel());

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
          break;
        case 1:
          return PlusScreen();
          break;
        case 2:
          return ShareScreen();
          break;
        case 3:
          return ProfileScreen();
      }
      return Container();
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
            print('selectedIdx : ' + index.toString());
            controller.changeCurrentIndex(index);
          },
          currentIndex: controller.currentIndex.value,
          selectedLabelStyle: FontStyles.Caption2_m.copyWith(color: AppColors.g6),
          unselectedLabelStyle:
          FontStyles.Caption2_m.copyWith(color: AppColors.g6),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home_unfill.svg',
                ),
                activeIcon: Lottie.asset(
                  'assets/lottie/MAIN2.json',
                  width: 24,
                  height: 24,
                  repeat: false,
                ),
                label: '홈'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/plus_unfill.svg',
                ),
                activeIcon: Lottie.asset(
                  width: 24,
                  height: 24,
                  'assets/lottie/Plus_new.json',
                  repeat: false,
                ),
                label: '생각더하기'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/search_unfill.svg',
                ),
                activeIcon: Lottie.asset(
                  'assets/lottie/search.json',
                  repeat: false,
                ),
                label: '생각나누기'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/profile_unfill.svg',
                ),
                activeIcon: Lottie.asset(
                  width: 24,
                  height: 24,
                  'assets/lottie/MY2.json',
                  repeat: false,
                ),
                label: '마이페이지'),
          ],
        ),
      ),
    );
  }
}