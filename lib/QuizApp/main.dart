import 'package:flutter/material.dart';
//import './question.dart';
//import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = [
    {
      'questionText': 'What is your fav color?',
      'answer': [
        {'text': 'Red','score': 10},
        {'text': 'White','score': 30},
        {'text': 'Black','score': 5},
        {'text': 'Green','score': 50}
      ]
    },
    {
      'questionText': 'Who\'s fav person?',
      'answer': [{'text': 'Father','score': 40},
        {'text': 'Mother','score': 50},
        {'text': 'Sister','score': 25},
        {'text': 'Brother','score': 20}]
    },
    {
      'questionText': 'What\'s your fav food?',
      'answer': [{'text': 'Burger','score': 10},
        {'text': 'Rice','score': 30},
        {'text': 'Milk','score': 45},
        {'text': 'Vegetable','score': 45}]
    }
  ];

  void _resetQuiz(){
    setState((){
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  int _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    print(_questionIndex);
    print(_questions[_questionIndex]['questionText']);
    setState(() {
      _questionIndex++;
    });
    //if (_questionIndex == questions.length) _questionIndex = 0;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz App'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(answerQuestion: _answerQuestion,questions: _questions,questionIndex: _questionIndex,)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String textFieldContent = 'Kichu na';
  String textFieldContent1 = 'Kichu na';
  var textboxcontroller = TextEditingController();
  var textboxcontroller1 = TextEditingController();

  @override
  void settxt() {
    setState(() {
      textFieldContent = textboxcontroller.text;
      textFieldContent1 = textboxcontroller1.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Myapp'),
        ),
        body: Column(
          children: [
            Text('This is a form'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                        const InputDecoration(hintText: 'Enter your name'),
                    controller: textboxcontroller,
                  ),
                ),
                ElevatedButton(
                  onPressed: settxt,
                  child: Text('Submit'),
                ),
              ],
            ),
            Text(textFieldContent),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                    const InputDecoration(hintText: 'Enter your name'),
                    controller: textboxcontroller1,
                  ),
                ),
                ElevatedButton(
                  onPressed: settxt,
                  child: Text('Submit'),
                ),
              ],
            ),
            Text(textFieldContent1),
          ],
        ),
      ),
    );
  }
}
 */
