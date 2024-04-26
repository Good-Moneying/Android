import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';
import 'package:meetup/routes/get_pages.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class NicknameScreen extends StatefulWidget {
  const NicknameScreen({super.key});

  @override
  State<NicknameScreen> createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen>
    with TickerProviderStateMixin {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController _nicknameController = TextEditingController();
  bool _isEnabled = true;

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                //진행률 바
                LinearPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  percent: 0.3,
                  backgroundColor: AppColors.g1,
                  progressColor: AppColors.y3,
                  barRadius: Radius.circular(10),
                ),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '1/4',
                      style:
                          FontStyles.Caption1_r.copyWith(color: AppColors.g4),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '두둑',
                        style:
                            FontStyles.Title2_b.copyWith(color: AppColors.v5),
                      ),
                      TextSpan(
                        text: '에서 사용할',
                        style: FontStyles.Title2_m.copyWith(
                            color: AppColors.black),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '닉네임',
                        style: FontStyles.Title2_b.copyWith(
                            color: AppColors.black),
                      ),
                      TextSpan(
                        text: '을 알려주세요',
                        style: FontStyles.Title2_m.copyWith(
                            color: AppColors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  '닉네임은 마이페이지에서 언제든 바꿀 수 있어요!',
                  style: FontStyles.Label2_sb.copyWith(color: AppColors.g4),
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: '최대 10자',
                          hintStyle: FontStyles.Label2_r.copyWith(
                              color: Color(0xFF888888)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.58,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //중복 검사에서 걸렸을 때
                        setState(() {
                          _isEnabled = false;
                        });
                        //중복 검사에서 걸리지 않았을 때
                        setState(() {
                          _isEnabled = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.v6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        '중복 검사',
                        style: FontStyles.Label2_sb.copyWith(
                            color: AppColors.white),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                  ],
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.INFO);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: AppColors.v5,
                    ),
                    child: Text(
                      '다음',
                      style: FontStyles.Bn1.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
