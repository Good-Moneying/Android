import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../style/ColorStyles.dart';
import '../style/FontStyles.dart';

class RecommendU extends StatelessWidget {
  const RecommendU({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: Get.height * 0.15,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                height: Get.height * 0.15,
                width: Get.width * 0.37,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Chip(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          backgroundColor: AppColors.g1,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          label: Text(
                            '코인',
                            style: FontStyles.Caption2_m.copyWith(
                                color: AppColors.g6),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.bookmark),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '“코인 급등 랠리?” 도지코인 거래 급감',
                      style: FontStyles.Ln1_m.copyWith(
                          color: AppColors.black),
                      softWrap: true,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/history.svg'),
                        Text(
                          '5분전',
                          style: FontStyles.Caption2_r.copyWith(
                              color: AppColors.g4),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
