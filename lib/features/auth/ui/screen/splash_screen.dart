import 'package:ecom/features/auth/ui/widget/app_logo_widget.dart';
import 'package:ecom/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'email_verification_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  static const String name = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }


  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    // Navigator.pushReplacementNamed(context, EmailVerificationScreen.name);
    Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            AppLogoWidget(),
            const Spacer(),
            // const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}


