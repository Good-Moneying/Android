import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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

  @override
  void onInit() {
    super.onInit();

    getProfileData();
    _profileModel = Rxn<ProfileModel>();
    getTermData();
    _archivesTermModel = Rxn<ArchivesTermModel>();
    getNewsLetterData('defaultCategory');
    _archivesNewsLetterModel = Rxn<ArchivesNewsLetterModel>();
  }

  Future<void> getProfileData() async{
    try{
      _profileModel.value = await _repository.getProfileData();
    } catch(e){
      print('$e');
    }
  }

  Future<void> getTermData() async{
    try{
      _archivesTermModel.value = await _repository.getTermData();
    } catch(e){
      print('$e');
    }
  }

  Future<void> getNewsLetterData(String category) async{
    try{
      _archivesNewsLetterModel.value = await _repository.getNewsLetterData(category);
    } catch(e){
      print('$e');
    }
  }

}