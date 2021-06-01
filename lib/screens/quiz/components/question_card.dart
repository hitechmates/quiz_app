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
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]
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
              Option(
                options: question.options!,
                type: question.type,
              )
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
