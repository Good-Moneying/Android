import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meetup/view/bottomNavigationBar.dart';

import '../../../routes/get_pages.dart';
import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';

class StopDialong extends StatelessWidget {
  const StopDialong({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(13.2),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Center(
          child: Text(
            "아직 생각 구름이 만들어지지 않았어요!",
            style: FontStyles.Bn1_b.copyWith(
                color: AppColors.black),
          ),
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "그만두시겠어요? 조금만 더 하면 완성해요!",
            style:
            FontStyles.Caption1_m.copyWith(
                color: AppColors.g4),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Image.asset('assets/icons/plus_dialog_char.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.offAll(BottomNavigationView());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Container(
                      width: 114, height: 48
                      ,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.g2)
                    ),
                      child: Center(child: Text('그만하기', style: FontStyles.Ln1_sb.copyWith(color: AppColors.g4),)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Container(
                      width: 160, height: 48
                      ,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: AppColors.v6
                    ),
                      child: Center(child: Text('구름 만들기', style: FontStyles.Ln1_sb.copyWith(color: AppColors.white),)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  }