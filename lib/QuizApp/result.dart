import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int finalScore;
  VoidCallback resetHandler;

  Result(this.finalScore, this.resetHandler);

  String get resultPhase {
    String resultText;
    if (finalScore <= 40)
      resultText = 'You did it';
    else if (finalScore <= 50)
      resultText = 'You are a strange!';
    else if (finalScore <= 70)
      resultText = 'You are awesome!!';
    else
      resultText = 'You are a Super human!!!';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            resultPhase,
            style: TextStyle(
              fontSize: 45,
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Play Again',style: TextStyle(fontSize: 20,color: Colors.white),),
            //color: Colors.green,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
