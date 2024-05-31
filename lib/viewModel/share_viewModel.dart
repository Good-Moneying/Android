import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ShareViewModel extends GetxController {

  TextEditingController thinkController = TextEditingController();

  Rx<bool> isSubmit = false.obs;

}