import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  Rx<bool> isEditorBookMark = false.obs;
  Rx<bool> isRecommendBookMark = false.obs;
  Rx<bool> isWordBookMark = false.obs;
  Rx<int> indicatorIndex = 0.obs;
  Rx<bool> isDialogAgree = false.obs;
  RxList<bool> isDialogAgreeList = [false, false, false].obs;

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