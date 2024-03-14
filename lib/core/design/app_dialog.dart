import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wameed/core/design/app_image.dart';
import 'package:wameed/core/logic/helper_methods.dart';
import 'package:wameed/views/finished/mutual/login.dart';

import '../theming/styles.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({super.key, required this.buttonText, required this.text, this.subText = "Done", this.onTap});

  final String buttonText, text, subText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      contentPadding: EdgeInsets.all(24),
      children: [
        AppImage(
          "https://img.freepik.com/free-vector/hand-drawn-tick_78370-490.jpg?t=st=1709839433~exp=1709843033~hmac=2a75df7b11039ef9ccd95c99f41b517845862bf9ada98917f5a4fe1ae112080b&w=740",
          width: 100.w,
          height: 100.w,
          color: Theme.of(context).primaryColor,
        ),
        // SizedBox(height: 16.h),
        Center(
          child: Text(
            subText,
            style: TextStyle(
              fontFamily: "poppins",
              fontSize: 36.sp,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            navigateTo(LoginView(), keepHistory: false);
          },
          child: Text(buttonText),
          style: TextButton.styleFrom(foregroundColor: Colors.deepOrange),
        ),
      ],
    );
  }
}
