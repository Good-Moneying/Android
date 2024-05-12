import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meetup/repository/home_repository.dart';

class HomeViewModel extends GetxController {

  final HomeRepository _repository = HomeRepository(); // 의존성 주입

  Rx<bool> isEditorBookMark = false.obs;
  Rx<bool> isRecommendBookMark = false.obs;
  Rx<bool> isWordBookMark = false.obs;
  Rx<int> indicatorIndex = 0.obs;
  Rx<bool> isDialogAgree = false.obs;
  RxList<bool> isDialogAgreeList = [false, false, false].obs;

  Rx<Map<String, dynamic>> news = Rx<Map<String, dynamic>>({}); // 뉴스 데이터를 저장할 Rx 변수 추가

  void getEditorNews() async{
    try{
      print("getEditorNews() start!");
      var data = await _repository.getEditorNews();
      news.value = data;

    } catch(e){
      print('$e');
    }
  }


  void selectAgree(int index) async {
    for (int i = 0; i < isDialogAgreeList.length; i++) {
      if (i == index) {
        isDialogAgreeList[i] = !isDialogAgreeList[i];
      }
    }

    if (isDialogAgreeList.contains(true)) {
      isDialogAgree.value = true;
    } else {
      isDialogAgree.value = false;
    }
  }


}