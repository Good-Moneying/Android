import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';

class RecommendU extends StatelessWidget {
  final String image;
  final String title;
  final Widget tag;
  final Widget history;
  final bool isRecommend;
  final Function() onRecommend;


  const RecommendU({
    super.key,
    required this.image,
    required this.title,
    required this.tag,
    required this.history,
    required this.isRecommend,
    required this.onRecommend,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          color: AppColors.white,
          surfaceTintColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 6, 12, 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    image,
                    height: Get.height * 0.13,
                    width: Get.width * 0.25,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 11),
                    child: Text(
                      title,
                      style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onRecommend,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(
                              color: AppColors.g2.withOpacity(0.3),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                            isRecommend
                                ? 'assets/icons/bookmark_fill.svg'
                                : 'assets/icons/bookmark_unfill.svg'
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 120,
          bottom: 10,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              tag,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: history,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
