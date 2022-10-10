import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_home_doctor/configs/themes/app_colors.dart';
import 'package:my_home_doctor/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? focusNodeNext;
  final String? titleText;
  final String? hintText;
  final String? errorMessageValidate;
  final bool? isPassword;
  final bool? isEmail;
  final bool? isNumberText;
  final bool? isBorderOutLine;
  final Widget? iconInField;
  final Function? callBackOfIconInField;
  final Function? callBackOnChange;
  final Function? callBackComplete;

  const TextFormFieldWidget(
      {Key? key,
      this.controller,
      this.focusNode,
      this.hintText,
      this.errorMessageValidate,
      this.isPassword,
      this.isEmail,
      this.isNumberText,
      this.iconInField,
      this.callBackOfIconInField,
      this.callBackOnChange,
      this.callBackComplete,
      this.focusNodeNext,
      this.isBorderOutLine,
      this.titleText})
      : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleText != null
            ? TextWidget(
                text: widget.titleText,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              )
            : Container(),
        widget.titleText != null
            ? SizedBox(
                height: 1.h,
              )
            : Container(),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextFormField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                keyboardType: widget.isNumberText == true ? TextInputType.number : TextInputType.text,
                obscureText: widget.isPassword == true ? true : false,
                style: TextStyle(
                  fontSize: 12.sp,
                ),
                inputFormatters: widget.isEmail == true
                    ? [
                        FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z@.+-_]")),
                      ]
                    : widget.isNumberText == true
                        ? [
                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                          ]
                        : null,
                decoration: InputDecoration.collapsed(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: AppColors.mainHintText,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ).copyWith(
                  isDense: true,
                  contentPadding: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 4.w, right: 12.w),
                  focusedBorder: widget.isBorderOutLine == true
                      ? const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.mainBlue, width: 1),
                        )
                      : const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.mainBlue, width: 1),
                        ),
                  enabledBorder: widget.isBorderOutLine == true
                      ? const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        )
                      : const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                ),
                onChanged: (value) {
                  if (widget.callBackOnChange != null) {
                    widget.callBackOnChange!(value);
                  }
                },
                onFieldSubmitted: (value) {
                  if (widget.callBackComplete != null) {
                    widget.callBackComplete!(value);
                  }
                  FocusScope.of(context).requestFocus(widget.focusNodeNext);
                },
              ),
              Positioned(
                right: 10,
                child: widget.iconInField != null
                    ? GestureDetector(
                        onTap: () {
                          if (widget.callBackOfIconInField != null) {
                            widget.callBackOfIconInField!();
                          }
                        },
                        child: widget.iconInField,
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        widget.errorMessageValidate != null && widget.errorMessageValidate != ""
            ? Container(
                padding: EdgeInsets.only(left: 3.5.w),
                margin: EdgeInsets.only(top: 1.h),
                child: TextWidget(
                  text: widget.errorMessageValidate,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                  maxLine: 9999,
                  textAlign: TextAlign.start,
                ),
              )
            : Container(),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
