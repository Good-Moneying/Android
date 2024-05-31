import 'package:flutter/material.dart';
import 'package:meetup/viewModel/share_viewModel.dart';
import 'package:get/get.dart';

class ShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ShareViewModel());
  }
}
