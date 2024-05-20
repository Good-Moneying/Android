import 'package:get/get.dart';
import 'package:meetup/repository/plus_repository.dart';

import '../model/plus/cloud_home_medel.dart';

class PlusHomeViewModel extends GetxController{

  final PlusRepository _repository = PlusRepository();

  late final Rxn<CloudHomeModel> _cloudHomeModel;

  CloudHomeModel? get cloudHomeModel => _cloudHomeModel.value;

  @override
  void onInit() {
    super.onInit();

    _cloudHomeModel = Rxn<CloudHomeModel>();

    getCloudHome();
  }

  Future<void> getCloudHome() async{
    try{
      _cloudHomeModel.value = await _repository.getCloudHome();
    } catch(e){
      print('$e');
    }
  }
}