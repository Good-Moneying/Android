import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/view/bottomNavigationBar.dart';

import '../../routes/get_pages.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('경제 금융 지식'),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '두둑',
                    style: TextStyle(color: Colors.purple),
                  ),
                  TextSpan(text: '과 함께 시작하세요!',
                    style: TextStyle(color: Colors.black),)],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                //임시적
                Get.offAll(BottomNavigationView());
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