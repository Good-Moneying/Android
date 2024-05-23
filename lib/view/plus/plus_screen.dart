import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/widgets/plus/plus_main_container.dart';
import 'package:meetup/viewModel/home_viewModel.dart';
import 'package:meetup/viewModel/plus_home_viewModel.dart';

import '../../design/style/FontStyles.dart';

class PlusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final plusHomeController = Get.put(PlusHomeViewModel());
    final newsController = Get.put(HomeViewModel());

    return Scaffold(
      backgroundColor: AppColors.g1,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '생각더하기',
              style: FontStyles.Heading2_b.copyWith(color: AppColors.black),
            ),
            SvgPicture.asset('assets/icons/plus_calendar.svg'),
          ],
        ),
      ),
      body: FutureBuilder(
        future: plusHomeController.getCloudHome(), // 클라우드 홈 모델을 가져오는 비동기 작업
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('데이터를 불러오는 중 오류가 발생했습니다'));
          } else {
            final cloudHomeModel = plusHomeController.cloudHomeModel;
            if (cloudHomeModel == null || cloudHomeModel.thinkingDetails == null) {
              return Center(child: Text('등록된 생각구름이 없습니다.'));
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: RichText(
                      text: TextSpan(
                        text: '나의 ',
                        style: FontStyles.Heading1_b.copyWith(color: AppColors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: '생각구름',
                            style: FontStyles.Heading1_b.copyWith(color: AppColors.v6),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0, top: 4),
                    child: Text(
                      '생각구름을 키우며 생각해볼까요?',
                      style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Text(
                            '최근 등록순',
                            style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),
                          ),
                        ),
                        SvgPicture.asset('assets/icons/plus_downarrow.svg'),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Column(
                    children: cloudHomeModel.thinkingDetails!.map((detail) {
                      final newsLetter = newsController.getNewsLetterFromCache(detail.newsLetterId ?? 0);
                      if (newsLetter != null) {
                        return PlusMainContainer(
                            index: cloudHomeModel.thinkingDetails!.indexOf(detail),
                            comment: newsLetter.title,
                            thumbnailUrl: detail.thumbnailUrl,
                            summarizedComment: detail.comment,
                            date: '방금전',
                            tag: plusHomeController.splitKeywords(detail?.keywords ?? '글로벌', 0)
                        );
                      } else {
                        // 뉴스레터가 캐시에 없으면 비동기적으로 로드
                        newsController.getEditorNews(detail.newsLetterId ?? 0);
                        return FutureBuilder(
                          future: newsController.getEditorNews(detail.newsLetterId ?? 0),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error loading newsletter');
                            } else {
                              final loadedNewsLetter = newsController.getNewsLetterFromCache(detail.newsLetterId ?? 0);
                              if (loadedNewsLetter != null) {
                                return PlusMainContainer(
                                    index: cloudHomeModel.thinkingDetails!.indexOf(detail),
                                    comment: loadedNewsLetter.title,
                                    thumbnailUrl: detail.thumbnailUrl,
                                    summarizedComment: detail.comment,
                                    date: '방금전',
                                    tag: plusHomeController.splitKeywords(detail?.keywords ?? '글로벌', 0)
                                );
                              } else {
                                return SizedBox(); // 없는 경우 빈 컨테이너를 반환하거나 다른 처리를 수행할 수 있습니다.
                              }
                            }
                          },
                        );
                      }
                    }).toList(),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
