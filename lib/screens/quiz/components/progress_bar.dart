import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double maxWidth = (size.width > 1000) ? size.width * 0.25 : kDefaultPadding;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: maxWidth),
      width: double.infinity,
      height: 10,
      color: kGrayColor,
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      // borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
