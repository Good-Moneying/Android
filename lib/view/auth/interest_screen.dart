import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../routes/get_pages.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //진행률 바
            LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              percent: 0.75,
              progressColor: Colors.purple,
              barRadius: Radius.circular(10),
            ),
            //
            RichText(
              text: TextSpan(
                children: [TextSpan(text: '00',
                  style: TextStyle(color: Colors.purple),),
                  TextSpan(text: '님의',
                    style: TextStyle(color: Colors.black),)],
              ),
            ),
            Text('관심사를 알려주세요'),
            Text('관심사와 관련된 뉴스레터를 받아보세요!'),
            SizedBox(height: Get.height * 0.35),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.FREQUENCY);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text('다음'),
            ),
          ],
        ),
      )),
    );
  }
}
