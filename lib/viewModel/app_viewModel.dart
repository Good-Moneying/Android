import 'package:get/get.dart';

class AppViewModel extends GetxService {

  //Rx+자료형, .obs를 붙여야 반응형 상태관리 사용 가능
  final RxInt currentIndex = 0.obs;

  void changeCurrentIndex(int index) {
    //값을 대입할 때 변수에 직접 넣어줘야함
    currentIndex(index);
  }
}

