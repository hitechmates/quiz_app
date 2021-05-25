import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/screens/quiz/components/option.dart';
import 'package:quiz_app/screens/quiz/components/progress_bar.dart';

import '../../../constants.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    Size size = MediaQuery.of(context).size;

    double maxWidth = (size.width > 1000) ? size.width * 0.25 : kDefaultPadding;

    return Container(
      margin: EdgeInsets.only(
          bottom: kDefaultPadding, left: maxWidth, right: maxWidth),
      // EdgeInsets.symmetric(horizontal: maxWidth, vertical: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(25)
      ),
      child:
          // Scrollbar(
          //   isAlwaysShown: true,
          //   child:
          SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            children: <Widget>[
              // Container(),
              Text(
                question.question!,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: kBlackColor),
              ),
              Text(
                question.subText!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: kGrayColor),
              ),
              SizedBox(height: kDefaultPadding / 2),
              ...List.generate(
                  question.options!.length,
                  (index) => Option(
                        index: index,
                        text: question.options![index].text,
                        type: question.type,
                        optionType: question.options![index].type,
                        values: question.options![index].values,
                        press: () => _controller.checkAns(question, index),
                      )),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
