import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppDropDown extends StatefulWidget {
  final List<String> list;
  final String title;

  const AppDropDown({Key? key, required this.list, required this.title}) : super(key: key);

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: widget.list.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
      expandedInsets:  EdgeInsets.zero,
      hintText: widget.title,
      trailingIcon: SvgPicture.asset(
        "assets/icons/svgs/arrow_down.svg",
        width: 16.w,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xfff7f7f7),
        filled: true,
        // isDense: true,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: const Color(0xff323232).withOpacity(.44),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(.29),
            width: 1.5.w,
          ),
        ),
      ),
      selectedTrailingIcon: SvgPicture.asset(
        "assets/icons/svgs/arrow_up.svg",
        width: 16.w,
      ),
      menuStyle: MenuStyle(
        // alignment: const Alignment(-1, 1.5),
        backgroundColor: const MaterialStatePropertyAll(Colors.white),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}
