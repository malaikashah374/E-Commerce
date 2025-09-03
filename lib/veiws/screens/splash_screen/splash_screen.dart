import 'package:e_commerce/veiws/screens/on_board/on_boad_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to next screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnboardingScreen())); 
      // Change '/onboarding' to your next screen's route
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00897B), // Teal background (same as design)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset(
            'assets/images/crafty furniture logo.png',
            height: 140,
            width: 140,
          
             // You can replace with custom furniture icon/image
              
            ),
            SizedBox(height: 20),
           
          ],
        ),
      ),
    );
  }
}
