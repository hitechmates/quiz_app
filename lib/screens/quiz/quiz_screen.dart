import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/profile/profile_screen.dart';

import 'components/body.dart';

class QuizScreen extends StatefulWidget {
  static const String title = "Quiz Screen";

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> questions;

  QuestionController _questionController = Get.put(QuestionController());

  getData() async {
    return await _questionController.fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      drawer: Container(
        width: size.width * 0.25,
        color: kWhite,
        child: Column(
          children: [
            ListTile(
              title: Center(
                child: Text(
                  '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
              indent: 6,
              endIndent: 6,
              color: kdarkBlue,
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: kdarkBlue,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProfileScreen()
                  ),
                );
              },
            ),
            Divider(
              thickness: 1,
              indent: 6,
              endIndent: 6,
              color: kdarkBlue,
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: kdarkBlue,
                  ),

                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
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
