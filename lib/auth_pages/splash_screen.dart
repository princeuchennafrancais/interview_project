import 'package:flutter/material.dart';
import 'package:interview_project/auth_pages/welcome.dart';
import '../core/utils/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Center(
        child: Text(
          "LWC",
          style: TextStyle(
            color: AppColors.lightBlue,
            fontSize: 56.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}