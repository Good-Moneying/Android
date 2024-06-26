import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/viewModel/home_viewModel.dart';

import '../../../routes/get_pages.dart';
import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';
import '../chip_editor.dart';
import '../history_widget.dart';

final editorController = Get.find<HomeViewModel>();

class EditorCard extends StatelessWidget {
  final String title;
  final String image;
  final bool isBookMark;
  final Function() onEditor;

  const EditorCard({
    super.key,
    required this.title,
    required this.image,
    required this.isBookMark,
    required this.onEditor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.EDITORNEWS);
      },
      child: Card(
        color: AppColors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    child: Image.network(
                      image,
                      height: Get.height * 0.25,
                      width: Get.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 13,
                    right: 16,
                    child: GestureDetector(
                      onTap: onEditor,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                          SvgPicture.asset(
                            isBookMark
                                ? 'assets/icons/bookmark_fill.svg'
                                : 'assets/icons/bookmark_unfill.svg',
                            colorFilter: isBookMark
                                ? null
                                : ColorFilter.mode(
                                    AppColors.g3, BlendMode.srcIn),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  title,
                  style:
                      FontStyles.Headline2_b.copyWith(color: AppColors.black),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: editorController.parseToday().map((keyword) {
                      return CustomChip(label: keyword);
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 10),
                    child: History(
                      diff: editorController.formatDate(
                        DateTime.parse(editorController
                            .homeModel!.todayNewsLetter.createdAt),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
