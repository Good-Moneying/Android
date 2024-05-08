import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'history_widget.dart';
import '../style/ColorStyles.dart';
import '../style/FontStyles.dart';
import 'chip_editor.dart';

class RecommendU extends StatelessWidget {
  const RecommendU({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                height: Get.height * 0.13,
                width: Get.width * 0.3,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Text(
                '“코인 급등 랠리?” 도지코인 거래 급감',
                style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                softWrap: true,
              ),
            ),
            SvgPicture.asset('assets/icons/bookmark_unfill.svg'),
          ],
        ),
      ),
    );
  }
}
