import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meetup/repository/home_repository.dart';

import '../model/news_letter_model.dart';

class HomeViewModel extends GetxController {

  final HomeRepository _repository = HomeRepository(); // 의존성 주입

  Rx<bool> isEditorBookMark = false.obs;
  Rx<bool> isRecommendBookMark = false.obs;
  Rx<bool> isWordBookMark = false.obs;
  Rx<int> indicatorIndex = 0.obs;
  Rx<bool> isDialogAgree = false.obs;
  RxList<bool> isDialogAgreeList = [false, false, false].obs;
  Rx<bool> isLookAlone = false.obs;

  Rx<NewsLetterModel> news = Rx<NewsLetterModel>(NewsLetterModel(
    publishedAt: "",
    editor: "",
    blocks: [],
    comments: [],
    isCommented: false,
  ));


  void getEditorNews() async{
    try{
      print("getEditorNews() start!");
      NewsLetterModel data = await _repository.getEditorNews();
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

   String splitParagraph(String text, int i) {
    List<String> parts = text.split("\n");
    return parts[i];
  }

  void selectLook() {
    isLookAlone.value = !isLookAlone.value;
  }

}