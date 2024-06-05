import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meetup/repository/share_repository.dart';

class ShareViewModel extends GetxController {
  final ShareRepository _repository = ShareRepository();

  TextEditingController thinkController = TextEditingController();

  Rx<bool> isSubmit = false.obs;

  //설문
  Future<void> survey() async {
    _repository.survey();
  }


}