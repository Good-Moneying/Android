import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PlusViewModel extends GetxController {

  var currentPage = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  String updatePage(int index){
    currentPage.value = index;
    if(currentPage.value ==0 ){
      return '왜 발생했을지 곰곰히 생각해보자!';
    } else if(currentPage.value == 1){
        return '어떤 효과가 나타날까?';
    }else if(currentPage.value == 2){
      return '내가 앞으로 주시해야할 건 뭘까?';
    } else{
      return '얼마 안 남았어! 한 번만 더 생각해보자';
    }
  }

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page?.round() ?? 0;
    });
  }
}