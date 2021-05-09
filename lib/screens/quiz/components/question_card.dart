import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/screens/quiz/components/option.dart';

import '../../../constants.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    print('aa====${question.options![0].text}');
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(children: [
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
                ))
      ]),
    );
  }
}
