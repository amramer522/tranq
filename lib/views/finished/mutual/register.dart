import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wameed/views/finished/mutual/otp.dart';
import '../../../core/design/app_drop_down.dart';
import '../../../core/design/app_field.dart';
import '../../../core/design/app_filled_button.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/app_back.dart';
import '../../../core/design/register_button.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../core/theming/styles.dart';
import 'time_of_work.dart';

class RegisterView extends StatefulWidget {
  final bool isDoctor;

  const RegisterView({super.key, required this.isDoctor});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final priceController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const AppBack(),
          title: Text("Registration"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.only(start: 19.w, end: 29.w, bottom: 16.h, top: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppImage(
                "register.jpg",
                height: 200,
              ),
              SizedBox(height: 16),
              AppField(
                labelText: "Username",
              ),
              AppField(labelText: "Email"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!widget.isDoctor) Expanded(child: AppField(labelText: "Age")),
                  if (!widget.isDoctor) SizedBox(width: 16),
                  Expanded(
                    child: AppDropDown(
                      list: ["Male", "Female"],
                      title: "Gender",
                    ),
                  ),
                ],
              ),
              if (widget.isDoctor)
                SizedBox(
                  height: 16,
                ),
              AppField(
                labelText: "Password",
                isPassword: true,
              ),
              AppField(labelText: "Confirm password", isPassword: true),
              if (widget.isDoctor)
                Column(
                  children: [
                    AppField(
                      labelText: "Price of Session",
                      keyboardType: TextInputType.number,
                      controller: priceController,
                      isDense: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Price of session !!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateTo(const TimesOfWorkView());
                      },
                      child: AbsorbPointer(
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            const AppField(
                              labelText: "Time of work",
                              isDense: true,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(bottom: 16.h, end: 16.w),
                              child: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.grey,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              AppButton(
                text: "Sign Up",
                onPressed: () {
                  navigateTo(OTPView(isFromRegister: true,));
                }
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
                        style: TextStyles.inter16Medium.copyWith(color: Theme.of(context).primaryColor.withOpacity(.67)),
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
