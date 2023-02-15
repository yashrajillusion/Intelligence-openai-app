import 'package:flutter/material.dart';

class CompletionProvider extends ChangeNotifier {
  bool isLoading = false;
  List<QuestionAnser> data = [];
  final controller = ScrollController();

  void setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  void pushQuestionAnser(bool isQuestion, String text) {
    QuestionAnser questionAnser =
        QuestionAnser(isQuestion: isQuestion, answer: isQuestion ? "" : text, question: isQuestion ? text : "");
    data.add(questionAnser);
    notifyListeners();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.jumpTo(controller.position.maxScrollExtent);
      // controller.animateTo(
      //   controller.position.maxScrollExtent,
      //   duration: const Duration(seconds: 1),
      //   curve: Curves.easeOut,
      // );
    });
  }
}

class QuestionAnser {
  final bool isQuestion;
  final String question;
  final String answer;

  QuestionAnser({required this.isQuestion, required this.question, required this.answer});
}
