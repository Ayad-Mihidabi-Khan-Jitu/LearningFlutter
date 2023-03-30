import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Social Media App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: MainScreen(),
    );
  }
}

///SHA-1: 0D:6A:EE:69:CB:A0:59:CB:20:DA:CF:3A:41:C7:17:60:1C:D9:DB:C2
///keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
///https://www.youtube.com/watch?v=GvIoBgmNgQw&t=654s