import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.radius = 10,
    required this.onPressed, this.paddingBottom=0,
  });

  final String text;
  final double radius,paddingBottom;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
