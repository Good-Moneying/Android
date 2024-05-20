import 'package:get/get.dart';
import 'package:meetup/viewModel/home_viewModel.dart';
import 'package:meetup/viewModel/plus_viewModel.dart';
import 'package:meetup/viewModel/profile_viewModel.dart';

class SettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeViewModel());
    Get.put(ProfileViewModel());
  }

}