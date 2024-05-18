import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';

import '../../design/style/FontStyles.dart';
import '../../routes/get_pages.dart';
import 'package:badges/badges.dart' as badges;

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
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Text('최근 등록순', style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),),
                  ),
                SvgPicture.asset('assets/icons/plus_downarrow.svg')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Stack(
                children: [
                  Container(
                    width: 328, height: 268,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/plus_te.png', width: 70, height: 70,),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('테슬라 주가 갑자기 오른 이유는?', style: FontStyles.Ln1_sb.copyWith(color: AppColors.black),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: badges.Badge(
                                      badgeContent: Text('글로벌', style: FontStyles.Caption2_m.copyWith(color: AppColors.v5)),
                                      badgeStyle: BadgeStyle(
                                        shape: BadgeShape.square,
                                        borderRadius: BorderRadius.circular(5), // 둥근 모서리 설정
                                        padding: EdgeInsets.fromLTRB(8,4,8,4), // 배지 내부 여백 설정
                                        badgeColor: AppColors.v1, // 배지 배경색 설정
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            width: 306, height: 104,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), color: AppColors.g1
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/plus_time.svg'),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text('1분 전',style: FontStyles.Caption2_r.copyWith(color: AppColors.g4),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 150.0),
                                child: Container(
                                  width: 104, height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(29),color: AppColors.v6
                                  ),
                                  child: Center(child: Text('생각더하기',style: FontStyles.Label2_sb.copyWith(color: AppColors.white),)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 16),
              child: Stack(
                children: [
                  Container(
                    width: 328, height: 268,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/plus_te.png', width: 70, height: 70,),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('테슬라 주가 갑자기 오른 이유는?', style: FontStyles.Ln1_sb.copyWith(color: AppColors.black),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: badges.Badge(
                                      badgeContent: Text('글로벌', style: FontStyles.Caption2_m.copyWith(color: AppColors.v5)),
                                      badgeStyle: BadgeStyle(
                                        shape: BadgeShape.square,
                                        borderRadius: BorderRadius.circular(5), // 둥근 모서리 설정
                                        padding: EdgeInsets.fromLTRB(8,4,8,4), // 배지 내부 여백 설정
                                        badgeColor: AppColors.v1, // 배지 배경색 설정
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            width: 306, height: 104,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), color: AppColors.g1
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/plus_time.svg'),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text('1분 전',style: FontStyles.Caption2_r.copyWith(color: AppColors.g4),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 150.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Get.toNamed(Routes.PLUSONBOARDING);
                                  },
                                  child: Container(
                                    width: 104, height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(29),color: AppColors.v6
                                    ),
                                    child: Center(child: Text('생각더하기',style: FontStyles.Label2_sb.copyWith(color: AppColors.white),)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
