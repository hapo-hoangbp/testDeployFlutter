import 'package:flutter/material.dart';
import 'package:my_home_doctor/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../configs/themes/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final Function? callBack;
  final String? title;
  final Color? backgroundButton;
  final Color? backgroundTitle;
  final double? widthButton;

  const ButtonWidget({
    Key? key,
    this.callBack,
    this.title,
    this.backgroundButton,
    this.backgroundTitle,
    this.widthButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (callBack != null) {
          callBack!();
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: widthButton ?? 80.w,
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        decoration: BoxDecoration(
          color: backgroundButton ?? Colors.transparent,
          borderRadius: BorderRadius.circular(60),
          border: Border.all(width: 1, color: backgroundButton ?? Colors.white),
        ),
        child: TextWidget(
          text: title ?? "",
          color: backgroundTitle ?? Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
