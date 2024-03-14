import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../core/theming/app_theme.dart';
import 'login.dart';
class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppTheme.appName,
                style: TextStyle(
                  fontFamily: "courgette",
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 48.sp,
                ),
              ),
              Text(
                AppTheme.appSlogn,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40.h),
              Container(
                height: 400.h,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/girl_interface_bg.png"),
                  ),
                  color: Theme.of(context).primaryColor.withOpacity(.24),
                  borderRadius: BorderRadius.circular(67.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffBFDFDF).withOpacity(.40),
                      offset: const Offset(0, 0),
                      blurRadius: 10.7,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                AppTheme.appDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(.6),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 50.h),
              FilledButton(
                onPressed: () {
                  CacheHelper.setIsFirstTime();
                  navigateTo(const LoginView(),keepHistory: false);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 17.w),
                    SvgPicture.asset(
                      "assets/icons/svgs/arrow_right.svg",
                      width: 24.w,
                      height: 12.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
