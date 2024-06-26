import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:meetup/model/plus/plus_comment_model.dart';
import 'package:meetup/repository/plus_repository.dart';
import 'package:meetup/repository/profile_repository.dart';

import '../design/widgets/plus/summary_dialog.dart';
import '../model/plus/cloud_sentences_model.dart';
import '../routes/get_pages.dart';

class PlusViewModel extends GetxController {

  final PlusRepository _repository = PlusRepository();

  var currentPage = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  Rx<bool> isSummary = false.obs;
  TextEditingController plusComment = TextEditingController();
  PageController pageControllerOnBoarding = PageController(initialPage: 0);
  final RxInt currentPageIndex = 0.obs;
  RxList<CloudSentenceModel> sentencesList = List.generate(5, (_) => CloudSentenceModel(' '), growable: true).obs;
  Rx<String> summary = ''.obs;


  String updatePage(int index){
    currentPage.value = index;
    if(currentPage.value ==0 ){
      return '왜 발생했을지 곰곰히 생각해보자!';
    } else if(currentPage.value == 1){
      return '어떤 효과가 나타날까?';
    }else if(currentPage.value == 2){
      return '내가 앞으로 주시해야할 건 뭘까?';
    } else {
      return '얼마 안 남았어! 한 번만 더 생각해보자';
    }
  }


  void nextPage(int index) {
    if (currentPageIndex.value < 3) {
      currentPageIndex.value++;
    } else{
      Get.toNamed(Routes.PLUSCOMPLETE, arguments: {'index': index});
    }
  }


  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page?.round() ?? 0;
    });
  }

  @override
  void onReady(){
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        context: Get.context!,
        barrierDismissible: true,
        builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SummaryDialog();
          },
        ),
      );
    });
  }

  void addSentence(String sentence, int index) {
    sentencesList[index] = CloudSentenceModel(sentence);
    for(int i = 0; i < sentencesList.length; i++) {
      print('뷰모델: ${sentencesList[i].sentence}');
    }
  }

  Future<void> postAllSentences(int thinkingId) async {
    try {
      await _repository.postCloudThinking(thinkingId, sentencesList);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> postSummaryRequired(String comment) async {
    try {
      PlusCommentModel dataModel = PlusCommentModel(comment);
      summary.value = await _repository.postSummaryRequired(dataModel);
      print('서버 응답: $summary');
      // 여기서 서버 응답 데이터를 사용하여 필요한 추가 작업을 수행합니다.
    } catch (e) {
      print('Error: $e');
    }
  }

  void setEditText(String summary){
    plusComment.text = summary;
  }
}
