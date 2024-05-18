import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meetup/model/home/home_model.dart';
import 'package:meetup/repository/home_repository.dart';

import '../model/home/news_letter_model.dart';

class HomeViewModel extends GetxController {
  Rx<bool> isEditorBookMark = false.obs;
  Rx<bool> isRecommendFirst = false.obs;
  Rx<bool> isRecommendSecond = false.obs;
  Rx<bool> isRecommendThird = false.obs;
  Rx<bool> isWordBookMark = false.obs;
  Rx<int> indicatorIndex = 0.obs;
  Rx<bool> isDialogAgree = false.obs;
  RxList<bool> isDialogAgreeList = [false, false, false].obs;
  RxString agreeCategory = 'unknown'.obs;

  Rx<bool> isLookAlone = false.obs;

  TextEditingController editorController = TextEditingController();
  TextEditingController liveController = TextEditingController();
  Rx<bool> isPostEditorNews = false.obs;
  Rx<bool> isPostLiveNews = false.obs;

  final HomeRepository _repository = HomeRepository(); // 의존성 주입
  late final Rxn<HomeModel> _homeModel;

  HomeModel? get homeModel => _homeModel.value;

  @override
  void onInit() {
    super.onInit();

    getHomeModel();
    _homeModel = Rxn<HomeModel>();
  }

  String setPerspective(List<bool> selectPerspective) {
    if (selectPerspective[0]) {
      return agreeCategory('긍정');
    } else if (selectPerspective[1]) {
      return agreeCategory('부정');
    } else if (selectPerspective[2]) {
      return agreeCategory('잘모르겠음');
    }
    return 'unknown';
  }

  Future<void> getHomeModel() async {
    try {
      _homeModel.value = await _repository.getHomeModel();
    } catch (e) {
      print('$e');
    }
  }

  //코멘트 작성
  Future<void> postComment(
      String type, int newsId, String content, String perspective) async {
    try {
      if (type == 'EDITOR') {
        isPostEditorNews(true);
        await _repository.postComment(newsId, content, perspective);
      } else {
        isPostLiveNews(true);
        await _repository.postComment(newsId, content, perspective);
      }
    } catch (e) {
      print('$e');
    }
  }

  Rx<NewsLetterModel> news = Rx<NewsLetterModel>(NewsLetterModel(
    publishedAt: "",
    editor: "",
    blocks: [],
    comments: [],
    isCommented: false,
  ));

  void getEditorNews() async {
    try {
      print("getEditorNews() start!");
      NewsLetterModel data = await _repository.getEditorNews();
      news.value = data;
    } catch (e) {
      print('$e');
    }
  }

  void selectAgree(int index) async {
    for (int i = 0; i < isDialogAgreeList.length; i++) {
      if (i == index) {
        isDialogAgreeList[i] = !isDialogAgreeList[i];
      } else {
        // 다른 버튼들의 상태를 초기화
        isDialogAgreeList[i] = false;
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
