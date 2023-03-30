import 'package:flutter/material.dart';
import 'package:learning_flutter/SocialMediaApp/widgets/button_post.dart';
import 'package:learning_flutter/SocialMediaApp/widgets/input_textform.dart';
import 'package:validators/validators.dart';

import '../services/dekhao_services.dart';
import '../services/firebase_services.dart';

class ForgotPasswordScreen extends StatefulWidget {

  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter your email for resetting password',style: TextStyle(fontSize: 20)),
            InputTextForm(
              inputFormTextController: _emailTextController,
              icon: Icons.email,
              textHint: "Email",
              errorText: 'Incorrect Email',
              validator: isEmail,
            ),
            ButtonPost(
              buttonName: 'Reset Password',
              textController: _emailTextController,
              formKey: formKey,
            ),
          ],
        ),
      ),
    );
  }
}
