import 'package:flutter/material.dart';
import 'package:learning_flutter/SocialMediaApp/screens/register_screen.dart';
import 'package:validators/validators.dart';
import '../services/dekhao_services.dart';
import '../services/firebase_services.dart';
import '../widgets/image_clipper.dart';
import '../widgets/input_textform.dart';
import 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  void dispose(){
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ClipPath(
                  clipper: CurveClipper(),
                  child: Image(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    image: AssetImage('assets1/images/login_background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
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
                  inputFormTextController: _emailTextController,
                  icon: Icons.email,
                  textHint: 'Email',
                  validator: isEmail,
                  errorText: 'Incorrect email',
                ),
                const SizedBox(
                  height: 5,
                ),
                InputTextForm(
                  inputFormTextController: _passwordTextController,
                  icon: Icons.lock,
                  textHint: 'Password',
                  passwordField: true,
                  validator: isNull,
                  errorText: 'Password can\'t be empty',
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ForgotPasswordScreen();
                      },
                    ));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseService fAuth = FirebaseService(context: context);
                      fAuth.signin(_emailTextController, _passwordTextController);
                    } else {
                      print('Login form error');
                      Dekhao.snackBarCout(context, 'Login form error');
                      //Cout(context, '{$_emailTextController}');
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
                      'Login',
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RegisterScreen()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: Theme.of(context).primaryColor,
                        height: 80,
                        child: Text(
                          'Don\'t have an account? Sign up',
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
        ),
      ),
    );
  }
}
