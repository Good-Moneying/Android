import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:meetup/design/widgets/comment_widget.dart';
import 'package:meetup/model/comment_model.dart';
import 'package:meetup/model/home/home_model.dart';
import 'package:meetup/repository/home_repository.dart';

import '../model/home/news_letter_model.dart';

class HomeViewModel extends GetxController {
  Rx<bool> isLoading = true.obs;

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
  late final Rxn<NewsLetterModel> _newsLetterModel;
  //late final RxList<CommentModel> _commentModel;

  RxList<CommentModel> comments = <CommentModel>[].obs;

  HomeModel? get homeModel => _homeModel.value;
  NewsLetterModel? get newsLetterModel => _newsLetterModel.value;
  //List<CommentModel> get commentModel => _commentModel.value;

  @override
  void onInit() {
    super.onInit();

    getHomeModel();
    _homeModel = Rxn<HomeModel>();
    _newsLetterModel = Rxn<NewsLetterModel>();
    //_commentModel = RxList<CommentModel>();
  }

  String setPerspective(List<bool> selectPerspective) {
    if (selectPerspective[0]) {
      return agreeCategory('POSITIVE');
    } else if (selectPerspective[1]) {
      return agreeCategory('NEGATIVE');
    } else if (selectPerspective[2]) {
      return agreeCategory('NOTHING');
    }
    return 'unknown';
  }

  Future<void> getHomeModel() async {
    try {
      _homeModel.value = await _repository.getHomeModel();
      isLoading.value = false;
    } catch (e) {
      print('$e');
    }
  }

  Future getEditorNews(int id) async {
    try {
      print("getEditorNews() start!");
      _newsLetterModel.value = await _repository.getEditorNews(id);
      //news.value = data;
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

        comments.add(CommentModel(perspective: perspective, content: content));
        //_commentModel.value?.content = content;

      } else {
        isPostLiveNews(true);
        await _repository.postComment(newsId, content, perspective);
      }
    } catch (e) {
      print('$e');
    }
  }

  //아카이브
  Future<void> archives(String type, int id) async {
    try {
      if (type == 'NEWS') {
        await _repository.archivesNews(id);
      } else {
        //TERM
        await _repository.archivesTerm(id);
      }
    } catch (e) {
      print('$e');
    }
  }

  //단어 아카이브

  // Rx<NewsLetterModel> news = Rx<NewsLetterModel>(NewsLetterModel(
  //   publishedAt: "",
  //   editor: "",
  //   blocks: [],
  //   comments: [],
  //   isCommented: false,
  // ));



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
    List<String> parts = text.split(".");
    return parts[i];
  }

  void selectLook() {
    isLookAlone.value = !isLookAlone.value;
  }
  String dateParsing(String date) {
    List<String> parts = date.split("T");
    return parts[0];
  }

  String splitKeywords(String text, int i) {
    List<String> parts = text.split(",");
    return parts[i];
  }
}
