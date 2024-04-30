import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';

class NewsLetterScreen extends StatelessWidget{
  const NewsLetterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,0),
              child: SvgPicture.asset('assets/images/newsletter_logo1.svg'),
            ),
            Expanded(
              child: Container(),
            ), // 공간을 채우기 위한 빈 컨테이너
          ],
        ),
        actions: [
          Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),// 앱 바 오른쪽에 아이콘 버튼을 배치
          child : IconButton(
            icon: SvgPicture.asset('assets/icons/newsletter_bell.svg'),
            onPressed: () {
              // 아이콘 버튼이 눌렸을 때 수행할 작업을 추가합니다.
            },
          ),
          ),
        ],
    ),

      body: SingleChildScrollView(

        child: Padding(
          padding : const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            RichText(
          text:TextSpan(
            text: '오늘의 ',
            style: FontStyles.Heading1_b.copyWith(color: AppColors.black), //기본style을 지정해줘야함
            children: <TextSpan>[
              TextSpan(text: '두둑',style: FontStyles.Heading1_b.copyWith(color: AppColors.v6), //기본style을 지정해줘야함
              ),
            ],
          ),
        ),Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0), // 오른쪽에 여백 추가
                  child: SvgPicture.asset('assets/images/newsletter_line.svg'),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0), // 오른쪽에 여백 추가
                      child: SvgPicture.asset('assets/images/newsletter_america.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 16, 0, 0), // 오른쪽에 여백 추가
                      child: SvgPicture.asset('assets/images/newsletter_rate.svg'),
                    ),
                    Expanded(
                        child: Container()
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16,16 , 0), // 오른쪽에 여백 추가
                      child: SvgPicture.asset('assets/images/newsletter_wallet.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 16, 0), // 오른쪽에 여백 추가
                      child: SvgPicture.asset('assets/images/newsletter_bookmark.svg'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16,0 , 0),
                      child : Text("테슬라 주가 갑자기\n오른 이유는?", style: FontStyles.Title2_sb.copyWith(color: AppColors.black))
                    )
                  ],
                )
        ],
        ),
    ),


      ),
    );
  }
}