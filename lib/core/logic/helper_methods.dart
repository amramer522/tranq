import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../design/app_image.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future navigateTo(Widget page, {bool keepHistory = true, bool replacement = false, bool closeLoading = false}) async {
  if (closeLoading) {
    Navigator.pop(navigatorKey.currentContext!);
  }
  final route = PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
  if (replacement) {
    return await Navigator.pushReplacement(navigatorKey.currentContext!, route);
  } else {
    return await Navigator.pushAndRemoveUntil(navigatorKey.currentContext!, route, (route) => keepHistory);
  }
}

enum MessageType { success, fail, warning }

Color getBgColor(MessageType msgType) {
  return msgType == MessageType.success
      ? const Color(0xff53A653)
      : msgType == MessageType.warning
          ? const Color(0xffFFCC00)
          : const Color(0xffEF233C);
}

void showMessage(String msg, {int duration = 2, MessageType type = MessageType.fail}) async {
  if (msg.isNotEmpty) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        elevation: 0,
        backgroundColor: getBgColor(type),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
        content: Row(
          children: [
            Expanded(
              child: Text(
                msg,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                softWrap: true,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
