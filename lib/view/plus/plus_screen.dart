import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/widgets/plus/plus_main_container.dart';
import 'package:meetup/viewModel/home_viewModel.dart';
import 'package:meetup/viewModel/plus_home_viewModel.dart';

import '../../design/style/FontStyles.dart';
import '../../routes/get_pages.dart';
import 'package:badges/badges.dart' as badges;

class PlusScreen extends GetView<PlusHomeViewModel> {

  @override
  Widget build(BuildContext context) {
    Get.put(PlusHomeViewModel());
    final plusHomeController = Get.put(PlusHomeViewModel());
    final newsController = Get.put(HomeViewModel());
    controller.getCloudHome();
    newsController.getEditorNews(0);

    return Scaffold(
      backgroundColor: AppColors.g1,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('생각더하기', style: FontStyles.Heading2_b.copyWith(color: AppColors.black),),
            SvgPicture.asset('assets/icons/plus_calendar.svg')
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: RichText(
                text: TextSpan(
                  text: '나의 ',
                  style: FontStyles.Heading1_b.copyWith(
                      color: AppColors.black), //기본style을 지정해줘야함
                  children: <TextSpan>[
                    TextSpan(
                      text: '생각구름',
                      style: FontStyles.Heading1_b.copyWith(
                          color: AppColors.v6), //기본style을 지정해줘야함
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21.0, top: 4),
              child: Text('생각구름을 키우며 생각해볼까요?', style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Text('최근 등록순', style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),),
                  ),
                  SvgPicture.asset('assets/icons/plus_downarrow.svg')
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Obx(() {
                    if (plusHomeController.cloudHomeModel == null || plusHomeController.cloudHomeModel!.thinkingDetails == null) {
                      return CircularProgressIndicator();
                    }

                    List<Widget> thinkingDetailsWidgets = [];
                    for (int i = 0; i < plusHomeController.cloudHomeModel!.thinkingDetails!.length; i++) {
                      newsController.getEditorNews(plusHomeController.cloudHomeModel?.thinkingDetails?[i].newsLetterId ?? 0);
                      thinkingDetailsWidgets.add(
                        PlusMainContainer(
                          comment: newsController.newsLetterModel?.title,
                          thumbnailUrl: plusHomeController.cloudHomeModel!.thinkingDetails![i].thumbnailUrl,
                          summarizedComment: plusHomeController.cloudHomeModel!.thinkingDetails![i].summarizedComment,
                        ),
                      );
                    }

                    return Column(
                      children: thinkingDetailsWidgets,
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: 12,)
          ],
        ),
      ),
    );
  }
}