import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/get_pages.dart';
import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';

class ThinkContainer extends StatelessWidget {
  final Widget textField;
  final Function()? onPressed;

  const ThinkContainer({
    super.key,
    required this.textField,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height * 0.5,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              16, 32, 16, 32),
          child: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.only(
                    bottom: 6.0),
                child: Text(
                  '왜 그렇게 생각하시나요?',
                  style:
                  FontStyles.Headline2_b
                      .copyWith(
                      color: AppColors
                          .black),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(
                    bottom: 16.0),
                child: Text(
                  '내 생각을 등록하면 다른 사람들 생각을 볼 수 있어요!',
                  style: FontStyles.Caption1_m
                      .copyWith(
                      color:
                      AppColors.g4),
                ),
              ),
              Container(
                height: Get.height * 0.24,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.g1,
                  borderRadius:
                  BorderRadius.circular(
                      10),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.all(
                      16.0),
                  child: textField,
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: onPressed,
                style:
                ElevatedButton.styleFrom(
                  minimumSize:
                  const Size.fromHeight(
                      50),
                  backgroundColor:
                  AppColors.v6,
                ),
                child: Text(
                  '등록하기',
                  style: FontStyles.Bn1_b
                      .copyWith(
                      color: AppColors
                          .white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
