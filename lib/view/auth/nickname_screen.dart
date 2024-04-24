import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/routes/get_pages.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class NicknameScreen extends StatefulWidget {
  const NicknameScreen({super.key});

  @override
  State<NicknameScreen> createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> with TickerProviderStateMixin{
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController _nicknameController = TextEditingController();
  bool _isEnabled = true;


  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

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
                percent: 0.25,
                progressColor: Colors.purple,
                barRadius: Radius.circular(10),
              ),
              //

              RichText(
                text: TextSpan(
                  children: [TextSpan(text: '두둑',
                    style: TextStyle(color: Colors.purple),),
                    TextSpan(text: '에서 사용할',
                      style: TextStyle(color: Colors.black),)
                  ],
                ),
              ),
              Text(
                '닉네임을 알려주세요',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '닉네임은 마이페이지에서 언제든 바꿀 수 있어요!',
                style: TextStyle(fontSize: 11),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: '최대 10자',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //중복 검사에서 걸렸을 때
                      setState(() {
                        _isEnabled = false;
                      });
                      //중복 검사에서 걸리지 않았을 때
                      setState(() {
                        _isEnabled = true;
                      });
                    },
                    child: Text('중복 검사'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.INFO);
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
