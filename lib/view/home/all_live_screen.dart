import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';
import 'package:meetup/viewModel/home_viewModel.dart';

import '../../design/style/FontStyles.dart';
import '../../design/widgets/chip_editor.dart';
import '../../design/widgets/home/recommend_box.dart';

class AllLiveScreen extends GetView<HomeViewModel> {
  const AllLiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(iconColor: AppColors.black, title: null),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '실시간 ',
                        style: FontStyles.Heading1_b.copyWith(
                            color: AppColors.black),
                      ),
                      TextSpan(
                        text: '트렌드 뉴스',
                        style:
                        FontStyles.Heading1_b.copyWith(color: AppColors.v6),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 36.0),
                child: Text('관심있는 뉴스레터를 추천해드려요!',
                style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),
                ),
              ),
              Obx(
                    () => RecommendU(
                      image:
                      controller.homeModel?.customizeNewsLetters[0].thumbnail ?? 'no data',
                      title:
                      controller.homeModel!.customizeNewsLetters[0].title,
                      isRecommend: controller.isRecommendFirst.value,
                      onRecommend: () {
                        controller.isRecommendFirst.value
                            ? controller.isRecommendFirst.value = false
                            : controller.isRecommendFirst.value = true;
                      },
                      tag: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.parseCustom1().map((keyword) {
                          return CustomChip(label: keyword);
                        }).toList(),
                      ),
                    ),
              ),
              Obx(
                    () => RecommendU(
                      image:
                      controller.homeModel?.customizeNewsLetters[1].thumbnail ?? 'no data',
                      title:
                      controller.homeModel!.customizeNewsLetters[1].title,
                      tag: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.parseCustom2().map((keyword) {
                          return CustomChip(label: keyword);
                        }).toList(),
                      ),
                      isRecommend: controller.isRecommendSecond.value,
                      onRecommend: () {
                        controller.isRecommendSecond.value
                            ? controller.isRecommendSecond.value = false
                            : controller.isRecommendSecond.value = true;
                      },
                    ),
              ),
              Obx(
                    () => RecommendU(
                      image:
                      controller.homeModel?.customizeNewsLetters[2].thumbnail ?? 'no data',
                      title:
                      controller.homeModel!.customizeNewsLetters[2].title,
                      tag: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.parseCustom3().map((keyword) {
                          return CustomChip(label: keyword);
                        }).toList(),
                      ),
                      isRecommend: controller.isRecommendThird.value,
                      onRecommend: () {
                        controller.isRecommendThird.value
                            ? controller.isRecommendThird.value = false
                            : controller.isRecommendThird.value = true;
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
