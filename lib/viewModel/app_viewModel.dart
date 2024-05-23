import 'package:get/get.dart';

//GetxService : 화면을 떠나도 메모리가 유지됨, 로그인상태를 유지하는 상황에서 적합
//GetxService의 메모리를 지우는 방법 -> Get.reset();을 통해 메모리를 모두 삭제, 그러나 controller까지 모두 지우게 돼서 좋지않다
//GetxController : 화면을 떠나면 메모리를 자동으로 삭제함, 값이 유지되지 않음
//GetxController에서 영구적으로 데이터를 유지하는 방법, permanent 속성 추가
//-> Get.put(GetxConroller(), permanent: true);
//permanent로 GetxService를 간접적으로 사용하는 방법 추천
class AppViewModel extends GetxService {

  //Rx+자료형, .obs를 붙여야 반응형 상태관리 사용 가능
  final RxInt currentIndex = 0.obs;

  void changeCurrentIndex(int index) {
    //값을 대입할 때 변수에 직접 넣어줘야함
    currentIndex(index);
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }


}

