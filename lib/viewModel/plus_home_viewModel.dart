import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:meetup/repository/plus_repository.dart';

import '../model/plus/cloud_home_medel.dart';
import '../model/plus/cloud_sentences_model.dart';

class PlusHomeViewModel extends GetxController{

  final PlusRepository _repository = PlusRepository();

  late final Rxn<CloudHomeModel> _cloudHomeModel;
  RxList<CloudSentenceModel> sentencesList = <CloudSentenceModel>[].obs;

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
  Future<void> postAllSentences(int thinkingId) async {
    try {
      await _repository.postCloudThinking(thinkingId, sentencesList);
    } catch (e) {
      print('Error: $e');
    }
  }
}