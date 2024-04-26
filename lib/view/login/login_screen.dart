import 'package:flutter/material.dart';
import '../../design/style/ColorStyles.dart';
import '../../design/widgets/login_button.dart';
import '../../service/auth_service.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('로그인 화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             LoginButton(
              backgroundColor: Color(0xFFFEE500),
              textColor: Colors.black87,
              icon: "assets/icons/kakao.svg",
              label: '카카오 로그인',
               onTap: kakaoLogin, //webSignIn(),
            ),
          ],
        ),
      ),
    );
  }
}
