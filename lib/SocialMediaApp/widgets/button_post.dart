import 'package:flutter/material.dart';

import '../services/dekhao_services.dart';
import '../services/firebase_services.dart';

class ButtonPost extends StatelessWidget {
  final String buttonName;
  final TextEditingController textController;
  final formKey ;
  ButtonPost({Key? key, required this.buttonName, this.formKey, required this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          FirebaseService fAuth = FirebaseService(context: context);
          fAuth.passwordreset(textController);
        } else {
          print('${textController.text.trim()} form error');
          Dekhao.snackBarCout(context, '${textController.text.trim()} form error');
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 60),
        alignment: Alignment.center,
        height: 45,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          buttonName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 26.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5),
        ),
      ),
    );
  }
}
