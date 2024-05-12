import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../design/style/ColorStyles.dart';

class LiveNewsScreen extends StatelessWidget {
  const LiveNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.g2,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SvgPicture.asset('assets/images/newsletter_logo1.svg'),
            ),
            Expanded(
              child: Container(),
            ), // 공간을 채우기 위한 빈 컨테이너
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            // 앱 바 오른쪽에 아이콘 버튼을 배치
            child: IconButton(
              icon: SvgPicture.asset('assets/icons/newsletter_bell.svg'),
              onPressed: () {
                // 아이콘 버튼이 눌렸을 때 수행할 작업을 추가합니다.
              },
            ),
          ),
        ],
      ),
    );
  }


}