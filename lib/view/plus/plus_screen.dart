import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/get_pages.dart';

class PlusScreen extends StatelessWidget {
  const PlusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('생각더하기 화면입니다.'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('생각더하기'),
          ],
        ),
      ),
    );
  }
}
