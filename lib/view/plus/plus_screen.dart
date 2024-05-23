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

class PlusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final plusHomeController = Get.put(PlusHomeViewModel());
    final newsController = Get.put(HomeViewModel());

    Future<void> _initializeData() async {
      await plusHomeController.getCloudHome();
      // 가져온 CloudHome 모델 기반으로 관련된 모든 editor news를 가져옴
      if (plusHomeController.cloudHomeModel != null) {
        for (var detail in plusHomeController.cloudHomeModel!.thinkingDetails ?? []) {
          await newsController.getEditorNews(detail.newsLetterId ?? 0);
        }
      }
    }

    return Scaffold(
      backgroundColor: AppColors.g1,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '생각더하기',
              style: FontStyles.Heading2_b.copyWith(color: AppColors.black),
            ),
            SvgPicture.asset('assets/icons/plus_calendar.svg'),
          ],
        ),
      ),
      body: FutureBuilder(
        future: _initializeData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('데이터를 불러오는 중 오류가 발생했습니다'));
          } else {
            return Obx(() {
              if (plusHomeController.cloudHomeModel == null ||
                  plusHomeController.cloudHomeModel!.thinkingDetails == null) {
                return Center(child: CircularProgressIndicator());
              }

              List<Widget> thinkingDetailsWidgets = [];
              for (var i = 0; i < plusHomeController.cloudHomeModel!.thinkingDetails!.length; i++) {
                var detail = plusHomeController.cloudHomeModel!.thinkingDetails![i];
                var newsLetter = newsController.getNewsLetterFromCache(detail.newsLetterId ?? 0);
                if (newsLetter != null) {
                  thinkingDetailsWidgets.add(
                    PlusMainContainer(
                      index: i, // 인덱스를 전달
                      comment: newsLetter.title,
                      thumbnailUrl: detail.thumbnailUrl,
                      summarizedComment: detail.comment,
                      date: '2024-05-23T03:31:24.112Z', //임의로
                    ),
                  );
                }
              }

              if (thinkingDetailsWidgets.isEmpty) {
                return Center(child: Text('등록된 생각구름이 없습니다.'));
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: RichText(
                        text: TextSpan(
                          text: '나의 ',
                          style: FontStyles.Heading1_b.copyWith(color: AppColors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '생각구름',
                              style: FontStyles.Heading1_b.copyWith(color: AppColors.v6),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 21.0, top: 4),
                      child: Text(
                        '생각구름을 키우며 생각해볼까요?',
                        style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0, ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text(
                              '최근 등록순',
                              style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),
                            ),
                          ),
                          SvgPicture.asset('assets/icons/plus_downarrow.svg'),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Column(
                      children: thinkingDetailsWidgets, // Widgets가 여기에 추가됩니다.
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              );
            });
          }
        },
      ),
    );
  }
}