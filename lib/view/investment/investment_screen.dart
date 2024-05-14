import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/get_pages.dart';

class InvestScreen extends StatelessWidget {
  const InvestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('모의투자 화면입니다.'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('모의투자'),
          ],
        ),
      ),
    );
  }
}