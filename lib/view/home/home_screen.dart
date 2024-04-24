import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈화면입니다.'),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Text('홈화면'),
            ],
          ),
      ),
    );
  }
}
