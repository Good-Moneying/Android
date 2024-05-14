import 'package:flutter/material.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('생각 나누기 화면입니다.'),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Text('생각 나누기'),
            ],
          )
      ),
    );
  }
}
