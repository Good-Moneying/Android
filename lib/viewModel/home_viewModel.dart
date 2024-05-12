import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  Rx<bool> isEditorBookMark = false.obs;
  Rx<bool> isRecommendBookMark = false.obs;
  Rx<bool> isWordBookMark = false.obs;
  Rx<int> indicatorIndex = 0.obs;

}