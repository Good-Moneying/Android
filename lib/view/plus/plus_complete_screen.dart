import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../routes/get_pages.dart';

class PlusCompleteScreen extends StatelessWidget {
  const PlusCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    final int index = arguments['index'];
    return Scaffold(
        backgroundColor: AppColors.v1,
        appBar: BackAppBar(iconColor: AppColors.black, title: null),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 63.0),
            child: Container(
              width: 253,
              height: 133,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.v2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center, // 가운데 정렬
                    text: TextSpan(
                      text: '생각구름',
                      style:
                          FontStyles.Headline1_b.copyWith(color: AppColors.v6),
                      children: <TextSpan>[
                        TextSpan(
                          text: '을 완성했어요',
                          style: FontStyles.Headline1_b.copyWith(
                              color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      '완성된 생각구름을 구경해볼까요?',
                      style: FontStyles.Lr1_m.copyWith(color: AppColors.g5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset('assets/icons/plus_complete.png'),
          GestureDetector(
            onTap: (){
              Get.toNamed(Routes.PLUSSTORAGE, arguments: {'index': index});
            },
            child: Container(
              width: 290,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: AppColors.v6),
              child: Center(
                  child: Text(
                '구경하기',
                style: FontStyles.Ln1_sb.copyWith(color: AppColors.white),
              )),
            ),
          ),
        ]));
  }
}
