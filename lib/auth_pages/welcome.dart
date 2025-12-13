import 'package:flutter/material.dart';
import 'package:interview_project/auth_pages/login.dart';
import 'package:interview_project/auth_pages/signup_screen.dart';

import '../core/utils/color_util.dart';
import '../core/widgets/custom_buttons.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/view-luxurious-yacht 1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.transparent,
                AppColors.transparent,
                AppColors.primaryBlue.withOpacity(0.8),
                AppColors.primaryBlue,
              ],
              stops: [0.0, 0.5, 0.57, 0.66],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Experience the Water.',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Elevate the Journey.',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60),
                  CustomButton(
                    text: 'Continue with Google',
                    onPressed: () {},
                    backgroundColor: AppColors.lightBlue.withOpacity(0.3),
                    textColor: AppColors.textWhite,
                    icon: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child:Image.asset("assets/icons/google_icon.png")
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    text: 'Sign up',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    },
                    backgroundColor: AppColors.buttonBlue,
                    textColor: AppColors.textWhite,
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}