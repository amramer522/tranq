import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wameed/core/design/app_back.dart';
import 'package:wameed/core/theming/styles.dart';

class DoctorChatsView extends StatelessWidget {
  const DoctorChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "Ahmed",
      "John",
      "Jilan",
      "Jessy",
      "Roma",
      "Geen",
    ];
    List<String> msgNumber = [
      "1",
      "0",
      "1",
      "0",
      "0",
      "0",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chats",
          style: TextStyles.poppins24BlackSemiBold,
        ),
        leading: const AppBack(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 24.w),
            child: Text(
              "Messages",
              style: TextStyles.inter20BlackSemiBold.copyWith(fontSize: 18.sp),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(24.h),
              itemBuilder: (context, index) => _Item(
                msgContent: "Thank you for you support",
                name: list[index],
                time: "2:35 Pm",
                msgNumber: msgNumber[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 24.h,
              ),
              itemCount: list.length,
            ),
          )
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
      {super.key,
      required this.name,
      required this.msgContent,
      required this.time, required this.msgNumber});

  final String name, msgContent, time,msgNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 72.w,
          height: 72.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xffD9D9D9).withOpacity(.43)),
          child: Center(
              child: Image.asset(
            "assets/images/user.png",
            width: 32.5.w,
            height: 32.5.w,
          )),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyles.inter20BlackSemiBold
                        .copyWith(fontSize: 18.sp),
                  ),
                  const Spacer(),
                  Text(
                    time,
                    style: TextStyles.inter20BlackSemiBold
                        .copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Text(
                    msgContent,
                    style: TextStyles.inter16Medium.copyWith(
                        fontSize: 12.sp, color: Colors.black.withOpacity(.36)),
                  ),
                  const Spacer(),
                  if(msgNumber!=0.toString())
                  CircleAvatar(
                    radius: 10.r,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(
                      "1",
                      style: TextStyles.inter20BlackSemiBold.copyWith(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
