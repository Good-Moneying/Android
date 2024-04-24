import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../routes/get_pages.dart';

class FrequencyScreen extends StatelessWidget {
  const FrequencyScreen({super.key});

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
              percent: 1,
              progressColor: Colors.purple,
              barRadius: Radius.circular(10),
            ),
            //
            Text('뉴스레터를'),
            Text('얼마나 자주 읽고 싶으신가요'),
            Text('꾸준한 습관을 만들 수 있게 도와드릴게요!'),
            SizedBox(height: Get.height * 0.35),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text('매일'),
            ),
            SizedBox(height: Get.height * 0.03),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text('일주일에 5 ~ 6번'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.WELCOME);
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
