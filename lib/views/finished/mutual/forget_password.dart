import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wameed/core/design/app_image.dart';

import '../../../core/design/app_back.dart';
import '../../../core/design/app_field.dart';
import '../../../core/design/app_filled_button.dart';
import '../../../core/logic/helper_methods.dart';
import 'otp.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _LoginViewState();
}

class _LoginViewState extends State<ForgetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBack(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppImage(
              "forget_password.jpg",
              height: 220,
            ),
            SizedBox(height: 16),
            Text(
              "Forgot Password?",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              "Please enter your email address!",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: Colors.black.withOpacity(.40),
              ),
            ),
            SizedBox(height: 16.h),
            Form(
              key: _formKey,
              child: AppField(
                labelText: "Enter your email",
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "enter your email";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(height: 16.h),
            AppButton(
              text: "Send Code",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  navigateTo(const OTPView(isFromRegister: false,));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
