import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meetup/model/mypage/archives_news_letter_model.dart';
import 'package:meetup/model/mypage/archives_term_model.dart';
import 'package:meetup/repository/profile_repository.dart';
import '../model/mypage/profile_model.dart';

class ProfileViewModel extends GetxController {
  final ProfileRepository _repository = ProfileRepository();

  late final Rxn<ProfileModel> _profileModel;
  late final Rxn<ArchivesTermModel> _archivesTermModel;
  late final Rxn<ArchivesNewsLetterModel> _archivesNewsLetterModel;


  ProfileModel? get profileModel => _profileModel.value;
  ArchivesTermModel? get archivesTermModel => _archivesTermModel.value;
  ArchivesNewsLetterModel? get archivesNewsModel => _archivesNewsLetterModel.value;

  Rx<bool> isLoading = true.obs;

  RxList<bool> attendedDays = <bool>[].obs;
  Rx<int> count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    // Rxn 객체 초기화
    _profileModel = Rxn<ProfileModel>();
    _archivesTermModel = Rxn<ArchivesTermModel>();
    _archivesNewsLetterModel = Rxn<ArchivesNewsLetterModel>();

    // 데이터 가져오기
    getProfileData();
    getTermData();
    getNewsLetterData('defaultCategory');
  }

  Future<void> getProfileData() async {
    try {
      _profileModel.value = await _repository.getProfileData();
      _updateAttendanceData();
    } catch (e) {
      print('$e');
    }
  }

  Future<void> getTermData() async {
    try {
      _archivesTermModel.value = await _repository.getTermData();
    } catch (e) {
      print('$e');
    }
  }

  Future<void> getNewsLetterData(String category) async {
    try {
      _archivesNewsLetterModel.value = await _repository.getNewsLetterData(category);
    } catch (e) {
      print('$e');
    }
  }

  /*void _updateAttendanceData() {
    count.value = 0;
    if (profileModel != null && profileModel!.attendances != null) {
      for (var attendance in profileModel!.attendances!.data!) {
        if (attendance.attendant ?? false) {
          count.value++;
        }
      }
    }
    print('리스트 : ${attendedDays}');
  }

  int getAttendedDays() {
    return count.value;
  }

  void _updateAttendance() {
    attendedDays.clear();
    if (profileModel != null && profileModel!.attendances != null) {
      var sortedData = List.from(profileModel!.attendances!.data!);
      sortedData.sort((a, b) => a['dayOfWeekValue'].compareTo(b['dayOfWeekValue']));

      for (var attendance in sortedData) {
        if (attendance['attendant'] ?? false) {
          attendedDays.add(attendance['dayOfWeekValue']);
        } else {
          attendedDays.add(0);
        }
      }
    }
    print('리스트 : ${attendedDays}');
  }

*/
  void _updateAttendanceData() {
    attendedDays.clear();
    count.value = 0;
    if (profileModel != null && profileModel!.attendances != null) {
      var sortedData = List.from(profileModel!.attendances!.data!);
      sortedData.sort((a, b) => a.dayOfWeekValue.compareTo(b.dayOfWeekValue));

      for (var attendance in sortedData) {
        if (attendance.attendant) {
          attendedDays.add(true);
          count.value++;
        } else{
          attendedDays.add(false);
        }
      }
    }
    print('리스트 : ${attendedDays}');
  }

  int getAttendedDays() {
    return count.value;
  }

  String splitKeywords(String text, int i) {
    List<String> parts = text.split("V");
    return parts[i];
  }
}
