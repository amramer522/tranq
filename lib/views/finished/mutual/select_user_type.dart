import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wameed/core/design/app_filled_button.dart';
import 'package:wameed/views/finished/mutual/register.dart';

import '../../../core/design/app_back.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../core/theming/styles.dart';

class SelectUserView extends StatefulWidget {
  const SelectUserView({super.key});

  @override
  State<SelectUserView> createState() => _SelectUserViewState();
}

class _SelectUserViewState extends State<SelectUserView> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBack(),
        title: Text("Select User Type"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _Item(
                      text: "Patient",
                      isSelected: selectedItem == 0,
                      img: "assets/icons/user.png",
                      onTap: () {
                        selectedItem = 0;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 16.h),
                    _Item(
                      text: "Doctor",
                      isSelected: selectedItem == 1,
                      img: "assets/icons/doctor.png",
                      onTap: () {
                        selectedItem = 1;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                SizedBox(height: 32),
                AppButton(
                  text: "Next",
                  onPressed: () {
                    navigateTo(RegisterView(
                      isDoctor: selectedItem == 1,
                    ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final bool isSelected;

  const _Item({super.key, required this.text, required this.img, required this.onTap, required this.isSelected});

  final String text, img;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(img),
              width: 100.w,
              height: 100.w,
              color: Colors.white,
            ),
            SizedBox(height: 15.h),
            Text(
              text,
              style: TextStyles.inter24WhiteBold,
            ),
          ],
        ),
      ),
    );
  }
}
