import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_project/auth_pages/verify_otp.dart';

import '../core/utils/color_util.dart';
import '../core/widgets/custom_buttons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isFormValid = false;
  String _selectedCountryCode = '+233';

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_validateForm);
    _lastNameController.addListener(_validateForm);
    _phoneController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (_isFormValid) {
      print('First Name: ${_firstNameController.text}');
      print('Last Name: ${_lastNameController.text}');
      print('Phone: $_selectedCountryCode${_phoneController.text}');
      print('Email: ${_emailController.text}');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyOtp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image 10.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h, left: 16.w, bottom: 71.3.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 20.w,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Register your account now',
                        style: TextStyle(
                          color: AppColors.hintTextColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'First Name',
                                  style: TextStyle(
                                    color: AppColors.textWhite,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                TextFormField(
                                  controller: _firstNameController,
                                  style: TextStyle(
                                    color: AppColors.textWhite,
                                    fontSize: 14.sp,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Enter first name',
                                    hintStyle: TextStyle(
                                      color: AppColors.hintTextColor.withOpacity(0.6),
                                      fontSize: 14.sp,
                                    ),
                                    filled: true,
                                    fillColor: AppColors.inputFieldBlue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 12.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Last Name',
                                  style: TextStyle(
                                    color: AppColors.textWhite,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                TextFormField(
                                  controller: _lastNameController,
                                  style: TextStyle(
                                    color: AppColors.textWhite,
                                    fontSize: 14.sp,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Enter last name',
                                    hintStyle: TextStyle(
                                      color: AppColors.hintTextColor.withOpacity(0.6),
                                      fontSize: 14.sp,
                                    ),
                                    filled: true,
                                    fillColor: AppColors.inputFieldBlue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 12.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: AppColors.inputFieldBlue,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 48.h,
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _selectedCountryCode,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.textWhite,
                                    size: 20.w,
                                  ),
                                  dropdownColor: AppColors.inputFieldBlue,
                                  style: TextStyle(
                                    color: AppColors.textWhite,
                                    fontSize: 14.sp,
                                  ),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        _selectedCountryCode = newValue;
                                      });
                                    }
                                  },
                                  items: <String>[
                                    '+233',
                                    '+234',
                                    '+255',
                                    '+254',
                                    '+27',
                                    '+1',
                                    '+44',
                                    '+33',
                                    '+49',
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Container(
                              height: 24.h,
                              width: 1.w,
                              color: AppColors.hintTextColor.withOpacity(0.3),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                  color: AppColors.textWhite,
                                  fontSize: 14.sp,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter phone number',
                                  hintStyle: TextStyle(
                                    color: AppColors.hintTextColor.withOpacity(0.6),
                                    fontSize: 14.sp,
                                  ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Email address',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        height: 48.h,
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 14.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: 'example@gmail.com',
                            hintStyle: TextStyle(
                              color: AppColors.hintTextColor.withOpacity(0.6),
                              fontSize: 14.sp,
                            ),
                            filled: true,
                            fillColor: AppColors.inputFieldBlue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Password',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        height: 48.h,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 14.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: AppColors.hintTextColor.withOpacity(0.6),
                              fontSize: 14.sp,
                            ),
                            filled: true,
                            fillColor: AppColors.inputFieldBlue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: _isFormValid ? _handleSignUp : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isFormValid
                                ? AppColors.lightBlue
                                : AppColors.lightBlue.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
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