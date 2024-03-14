import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wameed/core/design/app_image.dart';

class BeforeScanView extends StatefulWidget {
  const BeforeScanView({super.key});

  @override
  State<BeforeScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<BeforeScanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w, bottom: 94.h),
          child: Column(children: [
            AppImage(
              "face.png",
              height: 235.h,
              color: Theme.of(context).primaryColor,
              width: 161.w,
            ),
            SizedBox(height: 40.h),
            Text.rich(TextSpan(
              text: "Face",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),
              children: [
                TextSpan(
                  text: " ID",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                  ),
                ),
              ],
            )),
            SizedBox(height: 24.h),
            Text(
              textAlign: TextAlign.center,
              "Face ID is a facial Recognition feature which detects person from his face expressions to know if he has Psychiatric illness or not.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Theme.of(context).primaryColor.withOpacity(.76),
              ),
            ),
          ]),
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 8, left: 45.w, right: 45.w),
        child: FilledButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 17.w),
              AppImage("arrow_right.svg")
            ],
          ),
        ),
      ),
    );
  }
}
