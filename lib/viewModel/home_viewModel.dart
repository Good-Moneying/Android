import 'dart:developer';

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
  Rx<bool> isLoadingEditor = true.obs;
  Rx<bool> isLoadingReal = true.obs;

  Rx<bool> isEditorBookMark = false.obs;
  Rx<bool> isLiveBookMark = false.obs;
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
  final RxMap<int, NewsLetterModel> _newsLetterCache = <int, NewsLetterModel>{}.obs;



  Rx<bool> isFollowE = false.obs;
  Rx<bool> isLikeE = false.obs;
  Rx<bool> isFollowE2 = false.obs;
  Rx<bool> isLikeE2 = false.obs;

  Rx<bool> isFollowReal = false.obs;
  Rx<bool> isLikeReal = false.obs;
  Rx<bool> isFollowReal2 = false.obs;
  Rx<bool> isLikeReal2 = false.obs;



  final HomeRepository _repository = HomeRepository(); // 의존성 주입
  late final Rxn<HomeModel> _homeModel;
  late final Rxn<NewsLetterModel> _newsLetterModel;
  //late final RxList<CommentModel> _commentModel;

  //에디터 댓글&관점
  final comments = <String>[].obs;
  final perspecs = <String>[].obs;
  //실시간 댓글&관점
  final liveComments = <String>[].obs;
  final livePerspecs = <String>[].obs;

  //에디터 더하기
  void addComment(String comment) {
    comments.add(comment);
  }
  void addPerspec(String perspec) {
    perspecs.add(perspec);
  }

  //실시간 댓글 더하기
  void addLiveComment(String comment) {
    liveComments.add(comment);
  }
  void addLivePerspec(String perspec) {
    livePerspecs.add(perspec);
  }

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
      return agreeCategory('UNCERTAIN');
    }
    return 'unknown';
  }

  String perspecComment(String setPerspective) {
    if (setPerspective== 'POSITIVE') {
      return agreeCategory('긍정적이에요');
    } else if (setPerspective== 'NEGATIVE') {
      return agreeCategory('부정적이에요');
    } else if (setPerspective== 'UNCERTAIN') {
      return agreeCategory('잘 모르겠어요');
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

  NewsLetterModel? getNewsLetterFromCache(int id) {
    return _newsLetterCache[id];
  }

  Future<void> getEditorNews(int id) async {
    if (_newsLetterModel.value == null) {
      try {
        if (_newsLetterCache.containsKey(id)) {
          _newsLetterModel.value = _newsLetterCache[id];
          isLoadingEditor.value =false;
          isLoadingReal.value =false;
        } else {
          final newsLetter = await _repository.getEditorNews(id);
          _newsLetterCache[id] = newsLetter;
          _newsLetterModel.value = newsLetter;
          isLoadingEditor.value =false;
          isLoadingReal.value =false;
        }

      } catch (e) {
        print('$e');
      }
      log('뉴스레터2 : ${newsLetterModel?.title}');
    }
  }




  //코멘트 작성
  Future<void> postComment(
      String type, int newsId, String content, String perspective, bool isPrivate) async {
    try {
      if (type == 'EDITOR') {
        isPostEditorNews(true);
        await _repository.postComment(newsId, content, perspective, isPrivate);

       // comments.add(CommentModel(perspective: perspective, content: content));
        //_commentModel.value?.content = content;

      } else {
        isPostLiveNews(true);
        await _repository.postComment(newsId, content, perspective, isPrivate);
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

  //뉴스 카테고리 아카이브
  Future<void> archivesNewsCategory(int newsId, String category) async {
    try {

        await _repository.archivesNewsCategory(newsId, category);
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
    List<String> parts = text.split(",");
    return parts[i];
  }

  void selectLook() {
    isLookAlone.value = !isLookAlone.value;
  }


  //에디터 뉴스 태그
  List<String> parseToday() {
    // 쉼표로 구분된 키워드들을 리스트로 분할
    List<String> keywordList = homeModel!.todayNewsLetter.keywords.split(',');

    return keywordList;
  }

  //실시간 트렌드 뉴스 태그
  List<String> parseReal1() {
    // 쉼표로 구분된 키워드들을 리스트로 분할
    List<String> keywordList = homeModel!.realtimeTrendNewsLetters[0].keywords.split(',');

    return keywordList;
  }

  List<String> parseReal2() {
    // 쉼표로 구분된 키워드들을 리스트로 분할
    List<String> keywordList = homeModel!.realtimeTrendNewsLetters[1].keywords.split(',');

    return keywordList;
  }

  List<String> parseReal3() {
    // 쉼표로 구분된 키워드들을 리스트로 분할
    List<String> keywordList = homeModel!.realtimeTrendNewsLetters[2].keywords.split(',');

    return keywordList;
  }

  //추천 뉴스 태그
  List<String> parseCustom1() {
    // 쉼표로 구분된 키워드들을 리스트로 분할
    List<String> keywordList = homeModel!.customizeNewsLetters[0].keywords.split(',');

    return keywordList;
  }

  List<String> parseCustom2() {
    // 쉼표로 구분된 키워드들을 리스트로 분할
    List<String> keywordList = homeModel!.customizeNewsLetters[1].keywords.split(',');

    return keywordList;
  }

  List<String> parseCustom3() {
    // 쉼표로 구분된 키워드들을 리스트로 분할
    List<String> keywordList = homeModel!.customizeNewsLetters[2].keywords.split(',');

    return keywordList;
  }

  String dateParsing(String date) {
    List<String> parts = date.split("T");
    return parts[0];
  }

  String splitKeywords(String text, int i) {
    List<String> parts = text.split(",");
    return parts[i];
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inMinutes < 1) {
      return '방금 전';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}분전';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}시간 전';
    } else {
      return '${difference.inDays}일 전';
    }
  }
}
