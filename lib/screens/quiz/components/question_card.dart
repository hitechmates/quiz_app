import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/questions.dart';

import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    // print('aa====${question.options}');
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(children: [
        Text(
          question.question,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: kBlackColor),
        ),
        SizedBox(height: kDefaultPadding / 2),
        // ...List.generate(
        //     question.options.length,
        //     (index) => Option(
        //           index: index,
        //           text: question.options[index],
        //           type: question.type,
        //           press: () => _controller.checkAns(question, index),
        //         ))
      ]),
    );
  }
}
