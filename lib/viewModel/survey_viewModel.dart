import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/share/detail_survey_model.dart';
import '../repository/share_repository.dart';

class SurveyViewModel extends GetxController with GetSingleTickerProviderStateMixin  {
  Rx<bool> isFollow = false.obs;
  Rx<bool> isLike = false.obs;

  Rx<bool> isFollow2 = false.obs;
  Rx<bool> isLike2 = false.obs;

  Rx<bool> isFollow3 = false.obs;
  Rx<bool> isLike3 = false.obs;

  Rx<bool> allComment = true.obs;
  Rx<bool> agreeComment = false.obs;
  Rx<bool> disagreeComment = false.obs;

  final ShareRepository _repository = ShareRepository();

  late final Rxn<DetailSurveyModel> _detailSurveyModel;
  DetailSurveyModel? get detailSurveyModel => _detailSurveyModel.value;

  @override
  void onInit() {
    super.onInit();

    getDetailSurvey();
    _detailSurveyModel = Rxn<DetailSurveyModel>();
  }

  Future<void> getDetailSurvey() async {
    try {
      _detailSurveyModel.value = await _repository.detailSurvey();
      //isLoading.value = false;
    } catch (e) {
      print('$e');
    }
  }


}
