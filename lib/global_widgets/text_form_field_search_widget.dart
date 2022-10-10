import 'package:flutter/material.dart';
import 'package:my_home_doctor/configs/themes/app_colors.dart';
import 'package:sizer/sizer.dart';

class TextFormFieldSearchWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function? callBackComplete;

  const TextFormFieldSearchWidget({Key? key, this.controller, this.hintText, this.callBackComplete}) : super(key: key);

  @override
  State<TextFormFieldSearchWidget> createState() => _TextFormFieldSearchWidgetState();
}

class _TextFormFieldSearchWidgetState extends State<TextFormFieldSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontSize: 10.sp,
            ),
            decoration: InputDecoration.collapsed(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: AppColors.mainHintText,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ).copyWith(
              isDense: true,
              contentPadding: EdgeInsets.only(top: 1.2.h, bottom: 1.2.h, left: 10.w, right: 4.w),
            ),
            onFieldSubmitted: (value) {
              if (widget.callBackComplete != null) {
                widget.callBackComplete!(value);
              }
            },
          ),
          Positioned(
            left: 3.w,
            child: Icon(
              Icons.search_outlined,
              size: 16.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
