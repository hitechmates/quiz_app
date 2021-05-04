import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/question.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  static const String title = "Quiz Screen";
  late List<Question> questions;
  QuestionController _questionController = Get.put(QuestionController());

  getData() async {
    return await _questionController.fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(QuizScreen.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: _questionController.nextQuestion, child: Text("Skip"))
        ],
      ),
      body: FutureBuilder<dynamic>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            _questionController.setQuestions(snapshot.data);
            return Body();
          }
          return Text("loading ...");
        },
      ),
    );
  }
}
