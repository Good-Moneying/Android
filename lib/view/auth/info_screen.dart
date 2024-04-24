import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/get_pages.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  //생년월일
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [TextSpan(text: '00',
                    style: TextStyle(color: Colors.purple),),
                    TextSpan(text: '님의',
                      style: TextStyle(color: Colors.black),)],
                ),
              ),
              Text('기본 정보를 알려주세요'),
              Text('다양한 맞춤 정보를 추천해드릴게요!'),
              Text('*기본 정보는 외부에 노출되지 않아요.'),
              Text('성별'),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('남성'),
                  ),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('여성'),
                  ),
                ],
              ),
              Text('생년월일'),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          date = selectedDate;
                        });
                      }
                    },
                    child: Text(
                        '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'),
                  )),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('선택하기'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.INTEREST);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Text('다음'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
