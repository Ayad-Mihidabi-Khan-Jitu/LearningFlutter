import 'package:flutter/material.dart';
import '../QuizApp/question.dart';
import '../QuizApp/answer.dart';

class Quiz extends StatelessWidget {
  late final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;


  Quiz({required this.questions,
        required this.answerQuestion,
        required this.questionIndex
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answer'] as List <Map<String, Object>>).map((answer) {
          return Answer( () => answerQuestion(answer['score']), answer['text'].toString());
        }).toList()
        //Question(questions[_questionIndex]),
        //Answer(_answerQuestion),
      ],
    );
  }
}