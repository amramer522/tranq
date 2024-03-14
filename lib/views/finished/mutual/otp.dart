import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wameed/core/design/app_back.dart';
import 'package:wameed/core/logic/helper_methods.dart';
import 'package:wameed/views/finished/patient/home/view.dart';

import '../../../core/design/app_filled_button.dart';
import '../../../core/design/app_image.dart';
import '../../../core/theming/styles.dart';
import 'change_password.dart';

class OTPView extends StatefulWidget {
  final bool isFromRegister;

  const OTPView({super.key, required this.isFromRegister});

  @override
  State<OTPView> createState() => _LoginViewState();
}

class _LoginViewState extends State<OTPView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBack(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage(
              "otp.jpg",
              height: 220,
            ),
            SizedBox(height: 16),
            Text(
              "Verification",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              "Please enter the code sent on your\nemail address!",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "poppins",
                fontSize: 14.sp,
                color: Colors.black.withOpacity(.40),
              ),
            ),
            SizedBox(height: 44.h),
            PinCodeTextField(
              appContext: context,
              length: 4,
              textStyle: TextStyles.poppins24BlackSemiBold,
              keyboardType: TextInputType.number,
              cursorColor: Theme.of(context).primaryColor.withOpacity(.88),
              cursorHeight: 25.h,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(6.r),
                fieldHeight: 55.h,
                fieldWidth: 71.h,
                inactiveColor: Theme.of(context).primaryColor.withOpacity(.1),
                selectedColor: Theme.of(context).primaryColor,
                activeColor: Theme.of(context).primaryColor.withOpacity(.1),
              ),
            ),
            SizedBox(height: 24.h),
            AppButton(
              text: "Verify",
              onPressed: () {
                if (widget.isFromRegister) {
                  navigateTo(HomeView(), keepHistory: false);
                } else {
                  navigateTo(ChangePasswordView());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
