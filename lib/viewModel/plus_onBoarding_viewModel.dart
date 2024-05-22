import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../routes/get_pages.dart';

class PlusOnBoardingViewModel extends GetxController {
  final RxInt currentPageIndex = 0.obs;


  void nextPage() {
    if (currentPageIndex.value < 4) {
      currentPageIndex.value++;
    } else{
      Get.toNamed(Routes.PLUSSTEP);
    }
  }


}