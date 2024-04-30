import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsLetterScreen extends StatelessWidget{
  const NewsLetterScreen({super.key});

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('두둑'),
        ),
        body: SingleChildScrollView(
          child: Row(
            children: [
              SvgPicture.asset('assets/images/newsletter_logo.svg'),
              Text('두둑'),
            ],
          ),
        ),
      );
    }
  }

