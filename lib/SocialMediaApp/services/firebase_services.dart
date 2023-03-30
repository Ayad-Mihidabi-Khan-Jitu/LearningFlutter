import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/screens.dart';
import 'dekhao_services.dart';

class FirebaseService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late BuildContext context;
  bool signupSuccess = false;

  FirebaseService({required this.context});

  Future signup(TextEditingController emailTextController,
      TextEditingController passwordTextController) async
  {
    Dekhao.showLoadingCircle(context);
    await firebaseAuth.createUserWithEmailAndPassword(
        email: emailTextController.text.trim(),
        password: passwordTextController.text.trim())
        .then((value) {
      signupSuccess=true;
      print("Sign up complete!!");
    }).onError((error, stackTrace) {
      print("error: ${error.toString()}");
      Navigator.of(context).pop();
      Dekhao.alertDialogBox(context,error.toString());
      //Dekhao.snackCout(context, error.toString());
    });
  }

  Future signin(TextEditingController emailTextController,
      TextEditingController passwordTextController) async
  {
      Dekhao.showLoadingCircle(context);
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailTextController.text.trim(),
          password: passwordTextController.text.trim())
          .then((value) {
        print('Sign in Success!!');
        Dekhao.snackBarCout(context, 'Sign in Success!!');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => HomeScreen()));
      }).onError((error, stackTrace) {
        print('Error ${error.toString()}');
        //Dekhao.cout(context, error.toString());
        Navigator.of(context).pop();
        Dekhao.alertDialogBox(context,error.toString());
      });
  }

  Future adduserdetails(Map<String, dynamic> details) async
  {
    if(signupSuccess){
      //Dekhao.showLoading(context);
      await firebaseFirestore.collection('users').add(details).then((value) {
        print('Added Details for new signup!!');
        Dekhao.snackBarCout(context, 'Added Details for new signup!!');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => HomeScreen()));
      }).onError((error, stackTrace) {
        print('Error ${error.toString()}');
        //Dekhao.snackCout(context, error.toString());
        Navigator.of(context).pop();
        Dekhao.alertDialogBox(context,error.toString());
      });
    }
  }

  Future passwordreset(TextEditingController recoveryEmailTextController) async
  {
    Dekhao.showLoadingCircle(context);
    await firebaseAuth.sendPasswordResetEmail(email: recoveryEmailTextController.text.trim()).then((value) {
      print('password sent to the email!!');
      Dekhao.snackBarCout(context, 'password sent to the email!!');
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => LoginScreen()));
    }).onError((error, stackTrace) {
      print('Error ${error.toString()}');
      //Dekhao.snackCout(context, error.toString());
      Navigator.of(context).pop();
      Dekhao.alertDialogBox(context,error.toString());
    });
  }

/*
  try {

  } on SOMOSSA catch(e){
    print(e.message.toString());
  }
*/

}
