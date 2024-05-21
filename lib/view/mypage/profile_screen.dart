import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';
import 'package:meetup/viewModel/profile_viewModel.dart';

class ProfileScreen extends GetView<ProfileViewModel> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileViewModel());
    controller.getProfileData();
    controller.getTermData();
    controller.getNewsLetterData('');

    return Scaffold(
      backgroundColor: AppColors.g1,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              '마이페이지',
              style: FontStyles.Headline2_b.copyWith(color: AppColors.g6),
            ),
            Expanded(
              child: Container(),
            ),
            SvgPicture.asset('assets/images/mypage_setting.svg')
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 78,
                color: AppColors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/icons/mypage_profile.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 40,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(54),
                                    color: AppColors.v1,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'LV. 1',
                                      style: FontStyles.Caption1_sb.copyWith(
                                          color: AppColors.v6),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Obx(
                                    () => Text(
                                      controller.profileModel?.attendances
                                              ?.data?[0]?.dayOfWeek ??
                                          'No data',
                                      style: FontStyles.Bn1_b,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   width: 130,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, right: 16.0),
                      child: SizedBox(
                        child: Container(
                          width: 83,
                          height: 47,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.white,
                              border: Border.all(color: AppColors.g1)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/mypage_rain.png',
                                  width: 29,
                                  height: 31,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Obx(
                                      () => Text(
                                      controller.profileModel?.reward
                                          ?.toString() ??
                                          'N/A',
                                      style: FontStyles.Br1_sb.copyWith(
                                          color: AppColors.g6)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 54,
                  color: AppColors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '팔로워',
                                style: FontStyles.Caption1_r.copyWith(
                                    color: AppColors.g4),
                              ),
                              Text(
                                '0',
                                style: FontStyles.Ln1_m.copyWith(
                                    color: AppColors.g6),
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: VerticalDivider(
                          thickness: 1,
                          color: AppColors.g1,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '팔로잉',
                                style: FontStyles.Caption1_r.copyWith(
                                    color: AppColors.g4),
                              ),
                              Text(
                                '0',
                                style: FontStyles.Ln1_m.copyWith(
                                    color: AppColors.g6),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0, left: 40),
                    child: Text(
                      '목표 달성률',
                      style:
                          FontStyles.Headline2_b.copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 378,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20.0, left: 10),
                                  child: RichText(
                                      text: TextSpan(
                                    text: '일주일 중에 ',
                                    style: FontStyles.Lr1_m.copyWith(
                                        color: AppColors.g5),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '3',
                                        style: FontStyles.Br1_sb.copyWith(
                                            color: AppColors.v5), //기본style을 지정해줘야함
                                      ),
                                      TextSpan(
                                          text: '일동안 뉴스를 읽었어요!',
                                          style: FontStyles.Lr1_m.copyWith(
                                              color: AppColors.g5))
                                    ],
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '일',
                                        style: FontStyles.Ln1_m.copyWith(
                                            color: AppColors.g4),
                                      ),
                                      SizedBox(width: 2), // 간격 추가
                                      Text(
                                        '월',
                                        style: FontStyles.Ln1_m.copyWith(
                                            color: AppColors.g4),
                                      ),
                                      SizedBox(width: 2), // 간격 추가
                                      Text(
                                        '화',
                                        style: FontStyles.Ln1_m.copyWith(
                                            color: AppColors.g4),
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        '수',
                                        style: FontStyles.Ln1_m.copyWith(
                                            color: AppColors.g4),
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        '목',
                                        style: FontStyles.Ln1_m.copyWith(
                                            color: AppColors.g4),
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        '금',
                                        style: FontStyles.Ln1_m.copyWith(
                                            color: AppColors.g4),
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        '토',
                                        style: FontStyles.Ln1_m.copyWith(
                                            color: AppColors.g4),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 13.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/mypage_cloud_fill.svg'),
                                      SvgPicture.asset(
                                          'assets/icons/mypage_cloud_fill.svg'),
                                      SvgPicture.asset(
                                          'assets/icons/mypage_cloud_fill.svg'),
                                      SvgPicture.asset(
                                          'assets/icons/mypage_cloud_unfill.svg'),
                                      SvgPicture.asset(
                                          'assets/icons/mypage_cloud_unfill.svg'),
                                      SvgPicture.asset(
                                          'assets/icons/mypage_cloud_unfill.svg'),
                                      SvgPicture.asset(
                                          'assets/icons/mypage_cloud_unfill.svg'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 0, 0),
                child: Row(
                  children: [
                    Text(
                      '나의 아카이브',
                      style:
                          FontStyles.Headline2_b.copyWith(color: AppColors.g6),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/mypage_banner.png',
                      width: 378,
                      height: 110,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: 72,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Column(children:
                            [
                              Text(
                                '주식',
                                style: FontStyles.Bn2_sb.copyWith(
                                    color: AppColors.black),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '10',
                                  style: FontStyles.Caption2_m.copyWith(
                                      color: AppColors.v6),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '개',
                                      style: FontStyles.Caption2_m.copyWith(
                                          color:
                                              AppColors.g5), //기본style을 지정해줘야함
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          SvgPicture.asset(
                              'assets/images/mypage_transaction 17.svg')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        width: 180,
                        height: 72,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Column(children: [
                                Text(
                                  '코인',
                                  style: FontStyles.Bn2_sb.copyWith(
                                      color: AppColors.black),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '6',
                                    style: FontStyles.Caption2_m.copyWith(
                                        color: AppColors.v6),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '개',
                                        style: FontStyles.Caption2_m.copyWith(
                                            color:
                                                AppColors.g5), //기본style을 지정해줘야함
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            Image.asset(
                              'assets/images/mypage_coins.png',
                              width: 40,
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: 72,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Column(children: [
                              Text(
                                '금리',
                                style: FontStyles.Bn2_sb.copyWith(
                                    color: AppColors.black),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '3',
                                  style: FontStyles.Caption2_m.copyWith(
                                      color: AppColors.v6),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '개',
                                      style: FontStyles.Caption2_m.copyWith(
                                          color:
                                              AppColors.g5), //기본style을 지정해줘야함
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          Image.asset(
                            'assets/images/mypage_bank.png',
                            width: 40,
                            height: 40,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        width: 180,
                        height: 72,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Column(
                                  children: [
                                Text(
                                  '부동산',
                                  style: FontStyles.Bn2_sb.copyWith(
                                      color: AppColors.black),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '1',
                                    style: FontStyles.Caption2_m.copyWith(
                                        color: AppColors.v6),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '개',
                                        style: FontStyles.Caption2_m.copyWith(
                                            color:
                                                AppColors.g5), //기본style을 지정해줘야함
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            Image.asset(
                              'assets/images/mypage_bank_statement.png',
                              width: 40,
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 378,
                        height: 55,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                '나의 단어장',
                                style: FontStyles.Bn2_sb.copyWith(
                                    color: AppColors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: SvgPicture.asset(
                                  'assets/icons/mypage_chevron_right.svg'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 378,
                        height: 55,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                '나의 생각 모아보기',
                                style: FontStyles.Bn2_sb.copyWith(
                                    color: AppColors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: SvgPicture.asset(
                                  'assets/icons/mypage_chevron_right.svg'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 378,
                        height: 55,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                '좋아요한 생각 모아보기',
                                style: FontStyles.Bn2_sb.copyWith(
                                    color: AppColors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: SvgPicture.asset(
                                  'assets/icons/mypage_chevron_right.svg'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
