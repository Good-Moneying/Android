import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meetup/model/share/today_survey_model.dart';
import 'package:meetup/repository/share_repository.dart';

import '../model/share/detail_survey_model.dart';

class ShareViewModel extends GetxController {
  Rx<bool> isLoading = false.obs;

  final ShareRepository _repository = ShareRepository();
  TextEditingController thinkController = TextEditingController();
  Rx<bool> isSubmit = false.obs;
  late final Rxn<TodaySurveyModel> _todaySurveyModel;

  TodaySurveyModel? get todaySurveyModel => _todaySurveyModel.value;

  @override
  void onInit() {
    super.onInit();

    getTodaySurvey();
    _todaySurveyModel = Rxn<TodaySurveyModel>();
  }

  Future<void> getTodaySurvey() async {
    try {
      _todaySurveyModel.value = await _repository.todaySurvey();
      isLoading.value = false;
    } catch (e) {
      print('$e');
    }
  }

  Future<void> agreeSurvey(int surveyId) async {
    _repository.agree(surveyId);
  }

  Future<void> disagreeSurvey(int surveyId) async {
    _repository.disagree(surveyId);
  }

}