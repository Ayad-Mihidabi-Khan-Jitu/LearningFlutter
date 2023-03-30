import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexibleandExpand extends StatelessWidget {
  const FlexibleandExpand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('my')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            //fit: FlexFit.tight,
            flex: 2,
            child: Container(
              height: 50,
              color: Colors.red,
              child: const Text('Item-1'),
            ),
          ),
          Flexible(
            //fit: FlexFit.tight,
            flex: 2,
            child: Container(
              height: 50,
              color: Colors.cyan,
              child: const Text('Item-2'),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 50,
              //width: 50,
              color: Colors.purple,
              child: const Text('Item-3'),
            ),
          )
        ],
      ),
    );
  }
}
