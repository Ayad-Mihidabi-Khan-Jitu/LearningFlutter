import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../services/dekhao_services.dart';
import '../services/firebase_services.dart';
import '../widgets/input_textform.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _mobileTextController = TextEditingController();
  bool isEmailCorrect = false;
  bool isUsernameCorrect = false;
  bool isPasswordCorrect = false;
  bool isMobileCorrect = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(top: 50),
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'SOCIO',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                ),
              ),
              const SizedBox(height: 5),
              InputTextForm(
                  inputFormTextController: _usernameTextController,
                  icon: Icons.account_box,
                  textHint: 'Username',
                  validator: isAlpha,
                  errorText: 'Username incorrect',
                ),
              const SizedBox(height: 5),
              InputTextForm(
                isPwValidator: true,
                inputFormTextController: _passwordTextController,
                icon: Icons.lock,
                textHint: 'Password',
              ),
              const SizedBox(height: 5),
              InputTextForm(
                inputFormTextController: _emailTextController,
                icon: Icons.email,
                textHint: 'Email',
                validator: isEmail,
                errorText: 'Email incorrect',
              ),
              const SizedBox(height: 5),
              InputTextForm(
                inputFormTextController: _mobileTextController,
                icon: Icons.send_to_mobile,
                textHint: 'Mobile',
                validator: isAscii,
                errorText: 'Mobile incorrect',
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  //Cout(context,'Taped');
                  if (formKey.currentState!.validate()) {
                    FirebaseService fAuth = FirebaseService(context: context);
                    fAuth.signup(_emailTextController, _passwordTextController);
                    fAuth.adduserdetails({
                      'username':_usernameTextController.text.trim(),
                      'email':_emailTextController.text.trim(),
                      'mobile':_mobileTextController.text.trim()
                    });
                  } else {
                    print('Registration form error');
                    Dekhao.snackBarCout(context,'Registration form error');
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
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Theme.of(context).primaryColor,
                      height: 50,
                      child: Text(
                        'Already have an account? Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
