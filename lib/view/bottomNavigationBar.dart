import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/view/home/home_screen.dart';
import 'package:meetup/view/investment/investment_screen.dart';
import 'package:meetup/view/mypage/profile_screen.dart';
import 'package:meetup/view/search/search_screen.dart';
import 'package:meetup/viewModel/app_viewModel.dart';

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
          return InvestScreen();
          break;
        case 2:
          return SearchScreen();
          break;
        case 3:
          return ProfileScreen();
      }
      return Container();
    });
  }

  Widget _bottomNavigationBarWidget() {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          print('selectedIdx : ' + index.toString());
          controller.changeCurrentIndex(index);
        },
        currentIndex: controller.currentIndex.value,
        //디자인 나오면 수정 필요
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        //
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.money_outlined),
              activeIcon: Icon(Icons.money),
              label: '모의투자'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: '둘러보기'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: '마이페이지'),
        ],
      ),
    );
  }
}
