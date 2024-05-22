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

  RxList<int> attendedDays = <int>[].obs;
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

  void _updateAttendanceData() {
    attendedDays.clear();
    count.value = 0;
    if (profileModel != null && profileModel!.attendances != null) {
      for (var attendance in profileModel!.attendances!.data!) {
        if (attendance.attendant ?? false) {
          attendedDays.add(1);
          count.value++;
        } else {
          attendedDays.add(0);
        }
      }
    }
    print('리스트 : ${attendedDays}');
  }

  int getAttendedDays() {
    return count.value;
  }


}
