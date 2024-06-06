import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';

import '../../design/widgets/custom_button.dart';
import '../../routes/get_pages.dart';

class AddSurveyScreen extends StatelessWidget {
  const AddSurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: BackAppBar(
        iconColor: AppColors.black,
        title: Text(
          '설문지 만들기',
          style: FontStyles.Headline1_b.copyWith(color: AppColors.black),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 25, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  '제목',
                  style: FontStyles.Bn2_sb.copyWith(color: AppColors.black),
                ),
              ),
              TextFormField(
                //controller: controller.birthController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                decoration: InputDecoration(
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 16, vertical: 13),
                  hintText: '제목을 적어주세요',
                  hintStyle: FontStyles.Ln1_m.copyWith(color: AppColors.g3),
                  //border 색깔
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.g2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.v5,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 12.0),
                child: Text(
                  '투표 내용 입력',
                  style: FontStyles.Bn2_sb.copyWith(color: AppColors.black),
                ),
              ),
              TextFormField(
                //controller: controller.birthController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                decoration: InputDecoration(
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 16, vertical: 13),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          '찬성 |  ',
                          style: FontStyles.Ln1_m.copyWith(color: AppColors.v6),
                        ),
                      ),
                    ],
                  ),
                  hintText: '항목 입력하기',
                  hintStyle: FontStyles.Ln1_m.copyWith(color: AppColors.g3),
                  //border 색깔
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.g2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.v5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                //controller: controller.birthController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                decoration: InputDecoration(
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 16, vertical: 13),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          '반대 |  ',
                          style: FontStyles.Ln1_m.copyWith(color: AppColors.v6),
                        ),
                      ),
                    ],
                  ),
                  hintText: '항목 입력하기',
                  hintStyle: FontStyles.Ln1_m.copyWith(color: AppColors.g3),
                  //border 색깔
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.g2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.v5,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 41, bottom: 16.0),
                child: Text(
                  '뉴스레터 선택하기',
                  style: FontStyles.Bn2_sb.copyWith(color: AppColors.black),
                ),
              ),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.g1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 10.0),
                      child: SvgPicture.asset(
                        'assets/icons/add_survey.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.g3, BlendMode.srcIn),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Text(
                        '뉴스레터 선택하러 가기',
                        style: FontStyles.Caption1_sb.copyWith(
                            color: AppColors.g3),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomButton(
                backgroundColor: AppColors.v6,
                textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.white),
                label: '다음',
                onPressed: () {
                  Get.toNamed(Routes.SURVEY);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
