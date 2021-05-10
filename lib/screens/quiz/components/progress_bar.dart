import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => StepProgressIndicator(
                    totalSteps: controller.questions.length,
                    currentStep: controller.questionNumber.value,
                    size: 10,
                    padding: 0,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
