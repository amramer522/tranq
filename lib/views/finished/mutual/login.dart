import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/app_field.dart';
import '../../../core/design/app_filled_button.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/register_button.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../core/theming/app_theme.dart';
import '../patient/home/view.dart';
import 'forget_password.dart';
import 'select_user_type.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, this.fromDocRegister = false});

  final bool fromDocRegister;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController(text: "shosho@gmail.com");
  final passwordController = TextEditingController(text: "12345678");

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 10.h, top: 32.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: AppImage(
                          "login.jpg",
                          height: 220,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Welcome To",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "poppins",
                        ),
                      ),
                      Text(
                        AppTheme.appName,
                        style: TextStyle(
                          fontFamily: "courgette",
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 48.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      AppField(
                        labelText: "Enter your email",
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter an email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      AppField(
                        labelText: "Password",
                        isPassword: true,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter your password";
                          } else if (value.length < 8) {
                            return "password must have 8 or more characters";
                          } else {
                            return null;
                          }
                        },
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () {
                            navigateTo(const ForgetPasswordView());
                          },
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.black.withOpacity(.67),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          text: "Log In",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              navigateTo(const HomeView(), keepHistory: false);
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account ?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              navigateTo(SelectUserView());
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: Theme.of(context).primaryColor),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
