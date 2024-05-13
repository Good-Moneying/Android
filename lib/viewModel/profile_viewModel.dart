import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:meetup/repository/profile_repository.dart';

import '../model/mypage/profile_model.dart';

class ProfileViewModel extends GetxController {

  final ProfileRepository _repository = ProfileRepository();
  late final Rxn<ProfileModel> _profileModel;

  ProfileModel? get profileModel => _profileModel.value;

  @override
  void onInit() {
    super.onInit();

    getProfileData();
    _profileModel = Rxn<ProfileModel>();
  }

  Future<void> getProfileData() async{
    try{
      _profileModel.value = await _repository.getProfileData();
    } catch(e){
      print('$e');
    }
  }

}