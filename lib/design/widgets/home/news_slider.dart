import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../routes/get_pages.dart';
import '../../../viewModel/home_viewModel.dart';
import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';

final newsController = Get.find<HomeViewModel>();

newsSlider() {
  return CarouselSlider(
    items: [
      GestureDetector(
        onTap: () {
          Get.toNamed(Routes.LIVE);
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.network(
                newsController.homeModel?.realtimeTrendNewsLetters[0].thumbnail
                    ?? 'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
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
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 85, 12, 6),
                  child: Text(
                    newsController.homeModel!.realtimeTrendNewsLetters[0].title,
                    style: FontStyles.Lr1_sb.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              child: Text(
                '1',
                style: FontStyles.Title1_b.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
      Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: Image.network(
              newsController.homeModel?.realtimeTrendNewsLetters[1].thumbnail
                  ?? 'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 85, 12, 6),
                child: Text(
                  newsController.homeModel!.realtimeTrendNewsLetters[1].title,
                  style: FontStyles.Lr1_sb.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Text(
              '2',
              style: FontStyles.Title1_b.copyWith(color: AppColors.white),
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
            child: Image.network(
              newsController.homeModel?.realtimeTrendNewsLetters[2].thumbnail
              ?? 'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 85, 12, 6),
                child: Text(
                  newsController.homeModel!.realtimeTrendNewsLetters[2].title,
                  style: FontStyles.Lr1_sb.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Text(
              '3',
              style: FontStyles.Title1_b.copyWith(color: AppColors.white),
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
        newsController.indicatorIndex.value = index;
      },
    ),
  );
}

newsIndicator() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Obx(
        () => AnimatedSmoothIndicator(
          activeIndex: newsController.indicatorIndex.value,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.g5,
            dotColor: AppColors.g3,
            dotHeight: 6,
            dotWidth: 6,
          ),
        ),
      ),
    ],
  );
}
