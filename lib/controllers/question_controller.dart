import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/submit/submit_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;
  Animation get animation => this._animation; // To access our animation outside

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map((question) => Question(
          id: question['id'],
          question: question['question'],
          options: question['options']))
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  int _totalAnsweredQuestions = 0;
  int get totalAnsweredQuestions => this._totalAnsweredQuestions;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update(); //like setState
      });

    // start animation
    _animationController.forward();

    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _selectedAns = selectedIndex;

    // increment count of total anwered questions
    _totalAnsweredQuestions++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward();
    } else {
      // Get provides simple way to navigate
      Get.to(SubmitScreen());
    }
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
