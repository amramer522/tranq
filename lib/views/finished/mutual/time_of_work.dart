import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wameed/core/design/app_back.dart';
import 'package:wameed/core/design/app_filled_button.dart';
import 'package:wameed/core/theming/styles.dart';

class TimesOfWorkView extends StatefulWidget {
  const TimesOfWorkView({super.key});

  @override
  State<TimesOfWorkView> createState() => _TimesOfWorkViewState();
}

class _TimesOfWorkViewState extends State<TimesOfWorkView> {
  List<String> list = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBack(),
        title: Text(
          "Times of work",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose days of work",
              style: TextStyle(color: Colors.black.withOpacity(.79), fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            ...List.generate(list.length, (index) => _Item(dayTitle: list[index])),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Choose time of work",
              style: TextStyle(color: Colors.black.withOpacity(.79), fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 18.h),
            Row(
              children: [
                Expanded(child: ItemTime(text: "From")),
                SizedBox(width: 16),
                Expanded(child: ItemTime(text: "To")),
              ],
            ),
            SizedBox(height: 24.h),
            AppButton(
              text: "Save",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTime extends StatefulWidget {
  final String text;

  const ItemTime({Key? key, required this.text}) : super(key: key);

  @override
  State<ItemTime> createState() => _ItemTimeState();
}

class _ItemTimeState extends State<ItemTime> {
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await showTimePicker(context: context, initialTime: TimeOfDay.now());
        if (result != null) {
          selectedTime = result.format(context);
          setState(() {});
        }
      },
      child: Row(
        children: [
          SizedBox(width: 8),
          Text(
            widget.text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.w,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Center(
                child: Text(
                  selectedTime ?? "Choose",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor.withOpacity(selectedTime == null ? .5 : 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatefulWidget {
  const _Item({
    required this.dayTitle,
  });

  final String dayTitle;

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isChecked = !isChecked;
        setState(() {});
      },
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsetsDirectional.only(bottom: 16.h),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                color: Colors.white,
                border: isChecked
                    ? Border.all(color: Colors.transparent, width: 0)
                    : Border.all(
                        width: 1.5.w,
                        strokeAlign: BorderSide.strokeAlignInside,
                        color: const Color(0xff707070),
                      ),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Checkbox(
                value: isChecked,
                side: BorderSide.none,
                onChanged: (value) {
                  isChecked = value!;
                  setState(() {});
                },
                fillColor: isChecked
                    ? MaterialStateProperty.all(Theme.of(context).primaryColor.withOpacity(.7))
                    : MaterialStateProperty.all(Colors.transparent),
                checkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
            SizedBox(
              width: 30.w,
            ),
            Text(
              widget.dayTitle,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "poppins",
              ),
            )
          ],
        ),
      ),
    );
  }
}
