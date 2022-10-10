import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../configs/themes/app_colors.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextDecoration? textDecoration;

  const TextWidget({
    Key? key,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.maxLine,
    this.textAlign,
    this.fontFamily,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: GoogleFonts.getFont(
        fontFamily ?? "Montserrat",
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          decoration: textDecoration ?? TextDecoration.none,
        ),
      ),
      maxLines: maxLine ?? 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
