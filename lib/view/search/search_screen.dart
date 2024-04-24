import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기 화면입니다.'),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Text('둘러보기'),
            ],
          )
      ),
    );
  }
}
