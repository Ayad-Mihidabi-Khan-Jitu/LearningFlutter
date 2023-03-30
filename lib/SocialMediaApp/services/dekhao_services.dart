import 'package:flutter/material.dart';

class Dekhao {
  late final BuildContext context;
  late final String msg;

  static snackBarCout(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: const Duration(seconds: 4), content: Text(msg)));
    ///github e upload hocchilo naaaa
  }

  static alertDialogBox(BuildContext context, String exception) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            content: Text(exception),
          );
        });
  }

  static showLoadingCircle(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
            backgroundColor: Colors.white,
            strokeWidth: 5,
          ));
        });
  }
}
