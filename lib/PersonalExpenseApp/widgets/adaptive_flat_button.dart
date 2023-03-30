import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  String dateString;
  VoidCallback handler;
  AdaptiveFlatButton(this.dateString,this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
        onPressed: handler,
        child: Text(
          dateString,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ))
        : TextButton(
      //textColor: Theme.of(context).primaryColor,
      onPressed: handler,
      child: const Text(
        'Choose Date',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
