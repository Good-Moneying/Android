import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';

class NewsSlider extends StatelessWidget {
  const NewsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              //임시 사진
              child: Image.network(
                'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                height: Get.height * 0.16,
                width: Get.width * 0.6,
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                height: Get.height * 0.16,
                width: Get.width * 0.6,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                        colors: [
                          Color(0xFF212121),
                          Color(0xFF212121).withOpacity(0.1),
                        ])),
              ),
            ),
            Positioned(
              right: 10,
              child: Text(
                '1',
                style: FontStyles.Title1_b.copyWith(
                    color: AppColors.white),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 30,
              child: Text(
                '“코인 급등 랠리?”\n도지코인 거래 급감',
                style: FontStyles.Lr1_sb.copyWith(
                    color: AppColors.white),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              //임시 사진
              child: Image.network(
                'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                height: Get.height * 0.16,
                width: Get.width * 0.6,
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                height: Get.height * 0.16,
                width: Get.width * 0.6,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                        colors: [
                          Color(0xFF212121),
                          Color(0xFF212121).withOpacity(0.1),
                        ])),
              ),
            ),
            Positioned(
              right: 10,
              child: Text(
                '2',
                style: FontStyles.Title1_b.copyWith(
                    color: AppColors.white),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 30,
              child: Text(
                '“코인 급등 랠리?”\n도지코인 거래 급감',
                style: FontStyles.Lr1_sb.copyWith(
                    color: AppColors.white),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              //임시 사진
              child: Image.network(
                'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                height: Get.height * 0.16,
                width: Get.width * 0.6,
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                height: Get.height * 0.16,
                width: Get.width * 0.6,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                        colors: [
                          Color(0xFF212121),
                          Color(0xFF212121).withOpacity(0.1),
                        ])),
              ),
            ),
            Positioned(
              right: 10,
              child: Text(
                '3',
                style: FontStyles.Title1_b.copyWith(
                    color: AppColors.white),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 30,
              child: Text(
                '“코인 급등 랠리?”\n도지코인 거래 급감',
                style: FontStyles.Lr1_sb.copyWith(
                    color: AppColors.white),
              ),
            ),
          ],
        ),
      ],
      options: CarouselOptions(
        height: Get.height * 0.18,
        autoPlay: true,
        viewportFraction: 0.7,
        onPageChanged: (index, reason) {
          // setState(() {
          //   _indicatorIndex = index;
          // });
        },
      ),
    );
  }
}
