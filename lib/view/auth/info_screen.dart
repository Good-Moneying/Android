import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/viewModel/user_viewModel.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../design/style/FontStyles.dart';
import '../../design/widgets/progress_bar.dart';
import '../../routes/get_pages.dart';

class InfoScreen extends GetView<UserViewModel> {
  //생년월일
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              //진행률 바
              MyProgressBar(percent: controller.getPercentProgress.value),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Text(
                '2/4',
                style:
                FontStyles.Headline1_m.copyWith(color: AppColors.y6),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '00',
                      style: FontStyles.Title2_b.copyWith(color: AppColors.v5),
                    ),
                    TextSpan(
                      text: '님의',
                      style:
                          FontStyles.Title2_m.copyWith(color: AppColors.black),
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '기본 정보',
                      style:
                          FontStyles.Title2_b.copyWith(color: AppColors.black),
                    ),
                    TextSpan(
                      text: '를 알려주세요',
                      style:
                          FontStyles.Title2_m.copyWith(color: AppColors.black),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                '다양한 맞춤 정보를 추천해드릴게요!',
                style: FontStyles.Label2_sb.copyWith(color: AppColors.g4),
              ),
              Text(
                '*기본 정보는 외부에 노출되지 않아요.',
                style: FontStyles.Label2_r.copyWith(color: AppColors.g4),
              ),
              SizedBox(
                height: Get.height * 0.07,
              ),
              Text(
                '성별',
                style: FontStyles.Headline2_m.copyWith(color: AppColors.black),
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('남성'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        disabledForegroundColor: AppColors.g4,
                        foregroundColor: AppColors.v5,
                        side: BorderSide(
                          //삼항 연산자로 비활성&활성 나누기
                          color: AppColors.v5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('여성'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        disabledForegroundColor: AppColors.g4,
                        foregroundColor: AppColors.v5,
                        side: BorderSide(
                          //삼항 연산자로 비활성&활성 나누기
                          color: AppColors.v5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.07,
              ),
              Text(
                '생년월일',
                style: FontStyles.Headline2_m.copyWith(color: AppColors.black),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        // if (selectedDate != null) {
                        //   setState(() {
                        //     date = selectedDate;
                        //   });
                        // },
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: AppColors.g3,
                          ),
                        )),
                        child: Text(
                          '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '선택하기',
                      style:
                          FontStyles.Label2_sb.copyWith(color: AppColors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.v6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.INTEREST);
                    controller.setEnabled(0.77);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: AppColors.v5,
                  ),
                  child: Text(
                    '다음',
                    style: FontStyles.Bn1.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
