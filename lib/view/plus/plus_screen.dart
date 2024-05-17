import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';

import '../../design/style/FontStyles.dart';
import '../../routes/get_pages.dart';

class PlusScreen extends StatelessWidget {
  const PlusScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(left: 16.0, top: 20),
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
              padding: const EdgeInsets.only(left: 17.0, top: 4),
              child: Text('생각구름을 키우며 생각해볼까요?', style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),),
            )

          ],
        ),
      ),
    );
  }
}
