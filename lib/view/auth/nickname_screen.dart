import 'package:flutter/material.dart';

class NicknameScreen extends StatelessWidget {
  const NicknameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('닉네임 설정'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('닉네임 설정'),
          ],
        ),
      ),
    );
  }
}
