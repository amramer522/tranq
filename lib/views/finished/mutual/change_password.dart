import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/app_dialog.dart';
import '../../../core/design/app_field.dart';
import '../../../core/design/app_filled_button.dart';
import '../../../core/design/app_back.dart';
import '../../../core/design/app_image.dart';
import '../../../core/theming/styles.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _LoginViewState();
}

class _LoginViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBack(),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppImage(
                  "forget_password.jpg",
                  height: 220,
                ),
                SizedBox(height: 16),
                Text(
                  "Create New Password",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  "create your new password to log in!",
                  style: TextStyles.poppins14Black55Medium.copyWith(color: Colors.black.withOpacity(.44), fontFamily: "inter"),
                ),
                SizedBox(height: 16.h),
                AppField(
                  labelText: "Password",
                  isPassword: true,
                  bottomPadding: 24,
                  controller: passwordController,
                  validator: (pass) {
                    if (pass!.isEmpty) {
                      return "enter a new password";
                    } else if (pass.length < 8) {
                      return "password must be 8 or more characters ";
                    } else {
                      return null;
                    }
                  },
                ),
                AppField(
                    labelText: "Confirm password",
                    isPassword: true,
                    bottomPadding: 36,
                    validator: (pass) {
                      if (pass!.isEmpty) {
                        return "enter the password again";
                      } else if (passwordController.text != pass) {
                        return "password is not identical ";
                      } else {
                        return null;
                      }
                    }),
                AppButton(
                  text: "Change Password",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AppDialog(
                            buttonText: "Back to Log in",
                            text: "your reset",
                            onTap: () {},
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
