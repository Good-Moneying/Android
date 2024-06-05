import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/service/auth_service.dart';
import 'package:meetup/viewModel/profile_viewModel.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/appBar/back_appBar.dart';
import '../../design/widgets/custom_button.dart';
import '../../routes/get_pages.dart';

class SettingScreen extends GetView<ProfileViewModel> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: BackAppBar(
        iconColor: AppColors.black,
        title: Text(
          '뉴씽 설정',
          style: FontStyles.Headline1_b.copyWith(color: AppColors.black),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 25, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  '내 계정 관리',
                  style: FontStyles.Bn2_sb.copyWith(color: AppColors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        surfaceTintColor: Colors.transparent,
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        insetPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        contentPadding: EdgeInsets.all(8),
                        actionsAlignment: MainAxisAlignment.center,
                        title: Center(
                          child: Text(
                            '로그아웃 하시겠습니까?',
                            style:
                            FontStyles.Bn1_b.copyWith(color: AppColors.black),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              '취소',
                              style: FontStyles.Ln1_sb.copyWith(
                                  color: AppColors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              //로그아웃 함수
                              await signOut();
                            },
                            child: Text(
                              '확인',
                              style:
                              FontStyles.Ln1_sb.copyWith(color: AppColors.black),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: Get.width, // 폰의 너비만큼 설정
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                    child: Text(
                      '로그아웃',
                      textAlign: TextAlign.left,
                      style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0.1,
                color: AppColors.g2,
              ),
              InkWell(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        surfaceTintColor: Colors.transparent,
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        insetPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        contentPadding: EdgeInsets.all(16),
                        actionsAlignment: MainAxisAlignment.center,
                        title: Center(
                          child: Text(
                            '회원 탈퇴를 하시겠습니까?',
                            style:
                                FontStyles.Bn1_b.copyWith(color: AppColors.black),
                          ),
                        ),
                        content: Text(
                          '계정을 삭제하면 아카이브, 좋아요 등 모든 활동 정보가 삭제되고 다시 복구할 수 없습니다.',
                          style: FontStyles.Caption1_m.copyWith(
                              color: AppColors.g4),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              '취소',
                              style: FontStyles.Ln1_sb.copyWith(
                                  color: AppColors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              //회원탈퇴 함수
                              await controller.withdraw();
                            },
                            child: Text(
                              '확인',
                              style:
                                  FontStyles.Ln1_sb.copyWith(color: Colors.red.shade700),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: Get.width, // 폰의 너비만큼 설정
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                    child: Text(
                      '회원탈퇴',
                      textAlign: TextAlign.left,
                      style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0.1,
                color: AppColors.g2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
