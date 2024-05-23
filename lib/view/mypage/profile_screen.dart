import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
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
                        radius: 30.0,
                        backgroundImage:
                            AssetImage('assets/icons/mypage_lv1.png', ),
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
                                  width: 52,
                                  height: 25,
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
                                      controller.profileModel?.nickname ?? ' '
                                      ,style: FontStyles.Bn1_b,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, right: 20.0),
                      child: SizedBox(
                        child: Container(
                          width: 83,
                          height: 48,
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
                                          controller.profileModel?.reward?.toString() ?? '0',
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
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.g1),
              )
              ,Container(
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
                                controller.profileModel!.follower.toString(),
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
                                controller.profileModel!.followee.toString(),
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
                    padding: const EdgeInsets.only(top: 32.0, left: 20),
                    child: Text(
                      '목표 달성률',
                      style:
                          FontStyles.Headline2_b.copyWith(color: AppColors.g6),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
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
                            padding: const EdgeInsets.only(left: 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20,left: 15),
                                  child: Obx(()
                                    => RichText(
                                        text: TextSpan(
                                      text: '일주일 중에 ',
                                      style: FontStyles.Lr1_m.copyWith(
                                          color: AppColors.g5),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: controller.getAttendedDays().toString(),
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0, left: 5, right: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            '일',
                                            style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
                                          ),
                                          Text(
                                            '월',
                                            style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
                                          ),
                                          Text(
                                            '화',
                                            style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
                                          ),
                                          Text(
                                            '수',
                                            style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
                                          ),
                                          Text(
                                            '목',
                                            style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
                                          ),
                                          Text(
                                            '금',
                                            style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
                                          ),
                                          Text(
                                            '토',
                                            style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 13.0), // 텍스트와 아이콘 사이에 간격 추가
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          controller.attendedDays[6] == true
                                              ? SvgPicture.asset('assets/icons/mypage_cloud_fill.svg')
                                              : SvgPicture.asset('assets/icons/mypage_cloud_unfill.svg'),
                                          controller.attendedDays[0]
                                              ? SvgPicture.asset('assets/icons/mypage_cloud_fill.svg')
                                              : SvgPicture.asset('assets/icons/mypage_cloud_unfill.svg'),
                                          controller.attendedDays[1]
                                              ? SvgPicture.asset('assets/icons/mypage_cloud_fill.svg')
                                              : SvgPicture.asset('assets/icons/mypage_cloud_unfill.svg'),
                                          controller.attendedDays[2]
                                              ? SvgPicture.asset('assets/icons/mypage_cloud_fill.svg')
                                              : SvgPicture.asset('assets/icons/mypage_cloud_unfill.svg'),
                                          controller.attendedDays[3]
                                              ? SvgPicture.asset('assets/icons/mypage_cloud_fill.svg')
                                              : SvgPicture.asset('assets/icons/mypage_cloud_unfill.svg'),
                                          controller.attendedDays[4]
                                              ? SvgPicture.asset('assets/icons/mypage_cloud_fill.svg')
                                              : SvgPicture.asset('assets/icons/mypage_cloud_unfill.svg'),
                                          controller.attendedDays[5]
                                              ? SvgPicture.asset('assets/icons/mypage_cloud_fill.svg')
                                              : SvgPicture.asset('assets/icons/mypage_cloud_unfill.svg'),
                                        ],
                                      ),
                                    ],
                                  )
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
                padding: const EdgeInsets.fromLTRB(20, 44, 0, 0),
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
                padding: const EdgeInsets.fromLTRB(10, 20, 16, 0),
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
                              Obx(()=>
                                Text(
                                  controller.profileModel?.counts?[0].categoryName ?? ' ',
                                  style: FontStyles.Bn2_sb.copyWith(
                                      color: AppColors.black),
                                ),
                              ),
                              Obx(()
                                => RichText(
                                  text: TextSpan(
                                    text: controller.profileModel?.counts?[0].count.toString(),
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
                              ),
                            ]),
                          ),
                          Obx(
                                () =>
                                Image.network(
                                  width: Get.width,
                                  height: 142,
                                  fit: BoxFit.fitWidth,
                                  controller.profileModel?.counts?[0].logoUrl??'https://goodmoneying.s3.ap-northeast-2.amazonaws.com/category_logo/finance.png',
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return CircularProgressIndicator(); // 이미지 로딩 중이면 로딩 스피너 표시
                                    }
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object error,
                                      StackTrace? stackTrace) {
                                    return Text(
                                        'Failed to load image'); // 이미지 로딩에 실패하면 에러 메시지 표시
                                  },
                                ),
                          ),
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
                                Obx(()=>
                                  Text(
                                    controller.profileModel?.counts?[1].categoryName ?? ' ',
                                    style: FontStyles.Bn2_sb.copyWith(
                                        color: AppColors.black),
                                  ),
                                ),
                                Obx(()
                                  => RichText(
                                    text: TextSpan(
                                      text: controller.profileModel?.counts?[1].count.toString(),
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
                                ),
                              ]),
                            ),
                            Obx(
                                  () =>
                                  Image.network(
                                    width: Get.width,
                                    height: 142,
                                    fit: BoxFit.fitWidth,
                                    controller.profileModel?.counts?[1].logoUrl??'https://goodmoneying.s3.ap-northeast-2.amazonaws.com/category_logo/policy.png',
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return CircularProgressIndicator(); // 이미지 로딩 중이면 로딩 스피너 표시
                                      }
                                    },
                                    errorBuilder: (BuildContext context,
                                        Object error,
                                        StackTrace? stackTrace) {
                                      return Text(
                                          'Failed to load image'); // 이미지 로딩에 실패하면 에러 메시지 표시
                                    },
                                  ),
                            ),
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
                              Obx(()=>
                                Text(
                                  controller.profileModel?.counts?[2].categoryName ?? ' ',
                                  style: FontStyles.Bn2_sb.copyWith(
                                      color: AppColors.black),
                                ),
                              ),
                              Obx(()
                                => RichText(
                                  text: TextSpan(
                                    text: controller.profileModel?.counts?[2].count.toString(),
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
                              ),
                            ]),
                          ),
                          Obx(
                                () =>
                                Image.network(
                                  width: Get.width,
                                  height: 142,
                                  fit: BoxFit.fitWidth,
                                  controller.profileModel?.counts?[2].logoUrl??'https://goodmoneying.s3.ap-northeast-2.amazonaws.com/category_logo/global.png',
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return CircularProgressIndicator(); // 이미지 로딩 중이면 로딩 스피너 표시
                                    }
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object error,
                                      StackTrace? stackTrace) {
                                    return Text(
                                        'Failed to load image'); // 이미지 로딩에 실패하면 에러 메시지 표시
                                  },
                                ),
                          ),
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
                                Obx(()
                                  =>Text(
                                    controller.profileModel?.counts?[3].categoryName ?? ' ',
                                    style: FontStyles.Bn2_sb.copyWith(
                                        color: AppColors.black),
                                  ),
                                ),
                                Obx(()
                                  => RichText(
                                    text: TextSpan(
                                      text: controller.profileModel?.counts?[3].count.toString(),
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
                                ),
                              ]),
                            ),
                            Obx(
                                  () =>
                                  Image.network(
                                    width: Get.width,
                                    height: 142,
                                    fit: BoxFit.fitWidth,
                                    controller.profileModel?.counts?[3].logoUrl??'https://goodmoneying.s3.ap-northeast-2.amazonaws.com/category_logo/securities.png',
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return CircularProgressIndicator(); // 이미지 로딩 중이면 로딩 스피너 표시
                                      }
                                    },
                                    errorBuilder: (BuildContext context,
                                        Object error,
                                        StackTrace? stackTrace) {
                                      return Text(
                                          'Failed to load image'); // 이미지 로딩에 실패하면 에러 메시지 표시
                                    },
                                  ),
                            ),
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
