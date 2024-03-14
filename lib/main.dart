import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wameed/views/finished/mutual/change_password.dart';
import 'package:wameed/views/finished/mutual/login.dart';
import 'package:wameed/views/finished/mutual/register.dart';
import 'package:wameed/views/finished/mutual/select_user_type.dart';
import 'package:wameed/views/finished/mutual/splash.dart';
import 'package:wameed/views/finished/mutual/otp.dart';
import 'package:wameed/views/finished/mutual/time_of_work.dart';
import 'package:wameed/views/finished/patient/home/view.dart';
import 'core/logic/cache_helper.dart';
import 'core/logic/helper_methods.dart';
import 'core/theming/app_theme.dart';
import 'views/finished/mutual/forget_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await CacheHelper.init();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: AppTheme.appTheme,
        title: "Tranquility",
        home: child,
      ),
      child:  const SplashView(),
    );
  }
}
