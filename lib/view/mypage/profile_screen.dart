import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지 화면입니다.'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text('마이페이지'),
        ],
      )),
    );
  }
}
