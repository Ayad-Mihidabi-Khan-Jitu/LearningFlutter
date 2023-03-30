import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //final Function? selectHandler; ata kaj kore na tutorial er moto
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler,this.answerText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ElevatedButton(
        //color: Colors.pink,
        //textColor: Colors.white,
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: selectHandler,
      ),
    );
  }
}
