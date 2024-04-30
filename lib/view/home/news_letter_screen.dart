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
              padding: const EdgeInsets.fromLTRB(16,0,0,0),
              child: SvgPicture.asset('assets/images/newsletter_logo1.svg'),
            ),
            Expanded(
              child: Container(),
            ), // 공간을 채우기 위한 빈 컨테이너
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0), // 오른쪽에 여백 추가
              child: SvgPicture.asset('assets/images/newsletter_call.svg'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [],

        ),
      ),
    );
  }
}