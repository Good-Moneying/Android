import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:meetup/model/plus/cloud_specific_model.dart';
import 'package:meetup/repository/plus_repository.dart';

import '../model/plus/cloud_home_medel.dart';
import '../model/plus/cloud_sentences_model.dart';

class PlusHomeViewModel extends GetxController{

  final PlusRepository _repository = PlusRepository();

  late final Rxn<CloudHomeModel> _cloudHomeModel;
  late final Rxn<CloudSpecificModel> _cloudSpecificModel;

  CloudHomeModel? get cloudHomeModel => _cloudHomeModel.value;
  CloudSpecificModel? get cloudSpecificModel => _cloudSpecificModel.value;

  @override
  void onInit() {
    super.onInit();

    _cloudHomeModel = Rxn<CloudHomeModel>();
    _cloudSpecificModel = Rxn<CloudSpecificModel>();

    getCloudHome();
  }

  Future<void> getCloudHome() async{
    try{
      _cloudHomeModel.value = await _repository.getCloudHome();
    } catch(e){
      print('$e');
    }
  }

  Future<void> getCloudSpecific(int thinkingId) async{
    try{
      _cloudSpecificModel.value = await _repository.getCloudSpecific(thinkingId);
    } catch(e){
      print('$e');
    }
  }

  String splitKeywords(String text, int i) {
    List<String> parts = text.split(",");
    return parts[i];
  }

}