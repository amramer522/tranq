import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../core/theming/app_theme.dart';
import '../patient/home/view.dart';
import 'login.dart';
import 'on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      navigateTo(CacheHelper.isFirstTime()
          ? OnBoardingView()
          : CacheHelper.isAuth()
              ? HomeView()
              : LoginView(),keepHistory: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Pulse(
          child: CircleAvatar(
            radius: 180,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(height: 4),
                Text(
                  AppTheme.appSlogn,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Theme.of(context).primaryColor.withOpacity(.57),
                    // fontFamily: "satisfy",
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
