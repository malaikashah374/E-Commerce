import 'package:e_commerce/veiws/screens/login_screen/Login_screen.dart';
import 'package:e_commerce/veiws/screens/on_board/on_boad_screen.dart';
import 'package:e_commerce/veiws/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
