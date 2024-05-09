import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.g1,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('마이페이지',style: FontStyles.Headline2_b.copyWith(color: AppColors.g6),),
          Expanded(
            child: Container(),
          )
            ,SvgPicture.asset('assets/images/mypage_setting.svg')
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
                    children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0,12,0,0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/mypage_moi_dotori.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(width: 40,height: 18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(54),
                                color: AppColors.y5,
                              ),
                              child: Center(
                                child: Text(
                                  'LV. 1',
                                  style: FontStyles.Caption1_sb.copyWith(color: AppColors.g1),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text('김두둑'),
                            ),
                          ],
                        ),
                            SizedBox(width: 150,),
                            SizedBox(
                                  child: Container(width: 89,height: 47,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Colors.white
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/mypage_dotoricoin 1.png',width: 29,height: 31,),
                                          SizedBox(width: 8,)
                                          ,Text('12',style: FontStyles.Heading1_sb.copyWith(color: AppColors.g6)
                                          ),
                                      ],
                                    ),
                                  ),

                                                        ),
                          ),
                        SizedBox(width: 16,),
                      ],
                    ),
                  ),

                ),
              ],
            ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(width: 328,height: 172,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text('목표 달성률',style: FontStyles.Br2_sb.copyWith(color: Colors.black),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: RichText(text: TextSpan(
                                text: '일주일 중에 ', style: FontStyles.Reading_m.copyWith(color: AppColors.g5),
                                children: <TextSpan>[
                                  TextSpan(text: '3',style: FontStyles.Br1_sb.copyWith(color: AppColors.v5),//기본style을 지정해줘야함
                                  ),
                                  TextSpan(text: '일동안 뉴스를 읽었어요!', style: FontStyles.Reading_m.copyWith(color: AppColors.g5))
                                ],
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('일',style: FontStyles.Label1_Normal_m.copyWith(color: AppColors.g4),),
                                  Text('월',style: FontStyles.Label1_Normal_m.copyWith(color: AppColors.g4),),
                                  Text('화',style: FontStyles.Label1_Normal_m.copyWith(color: AppColors.g4),),
                                  Text('수',style: FontStyles.Label1_Normal_m.copyWith(color: AppColors.g4),),
                                  Text('목',style: FontStyles.Label1_Normal_m.copyWith(color: AppColors.g4),),
                                  Text('금',style: FontStyles.Label1_Normal_m.copyWith(color: AppColors.g4),),
                                  Text('토',style: FontStyles.Label1_Normal_m.copyWith(color: AppColors.g4),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                    ],
                  ),
          )),
    );
  }
}
