import 'package:flutter/material.dart';
import 'package:my_home_doctor/global_widgets/button_widget.dart';
import 'package:my_home_doctor/global_widgets/icon_pop_screen_widget.dart';
import 'package:my_home_doctor/global_widgets/text_form_field_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../configs/languages/applocalization.dart';
import '../../../../../configs/routers/app_name_routes.dart';
import '../../../../../configs/themes/app_colors.dart';
import '../../../../../global_widgets/text_widget.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconPopScreenWidget(
              callBack: () => Navigator.of(context).pop(),
            ),
          ),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            width: 100.w,
            height: 100.h,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: AppLocalizations.of(context).getTranslate("createAccountTitlePage"),
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  TextFormFieldWidget(
                    controller: _nameController,
                    focusNodeNext: _focusNodeEmail,
                    titleText: "Name",
                    hintText: "Name",
                    errorMessageValidate: "",
                    callBackOnChange: null,
                    callBackComplete: null,
                    isBorderOutLine: true,
                    iconInField: Icon(
                      Icons.mode_edit_outline_outlined,
                      size: 18.sp,
                      color: AppColors.mainBlue,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormFieldWidget(
                    controller: _emailController,
                    focusNode: _focusNodeEmail,
                    focusNodeNext: _focusNodePassword,
                    titleText: "Email",
                    hintText: "Email",
                    errorMessageValidate: "",
                    callBackOnChange: null,
                    callBackComplete: null,
                    isBorderOutLine: true,
                    iconInField: Icon(
                      Icons.mode_edit_outline_outlined,
                      size: 18.sp,
                      color: AppColors.mainBlue,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormFieldWidget(
                    controller: _passwordController,
                    focusNode: _focusNodePassword,
                    focusNodeNext: _focusNodeConfirmPassword,
                    titleText: "Password",
                    hintText: "Password",
                    errorMessageValidate: "",
                    callBackOnChange: null,
                    callBackComplete: null,
                    isBorderOutLine: true,
                    iconInField: Icon(
                      Icons.mode_edit_outline_outlined,
                      size: 18.sp,
                      color: AppColors.mainBlue,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormFieldWidget(
                    controller: _confirmPasswordController,
                    focusNode: _focusNodeConfirmPassword,
                    focusNodeNext: null,
                    titleText: "Confirm Password",
                    hintText: "Confirm Password",
                    errorMessageValidate: "",
                    callBackOnChange: null,
                    callBackComplete: null,
                    isBorderOutLine: true,
                    iconInField: Icon(
                      Icons.mode_edit_outline_outlined,
                      size: 18.sp,
                      color: AppColors.mainBlue,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4.h),
                    child: ButtonWidget(
                      callBack: () {
                        FocusScope.of(context).unfocus();
                        // Navigator.of(context).pushNamed(AppNameRoutes.CREATE_ACCOUNT_SUCCESS);
                      },
                      title: AppLocalizations.of(context).getTranslate("create"),
                      backgroundButton: AppColors.mainBlue,
                      backgroundTitle: Colors.white,
                      widthButton: 40.w,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      // Navigator.of(context).pushNamed(AppNameRoutes.FIRST_SCAN);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 4.h),
                      child: TextWidget(
                        text: AppLocalizations.of(context).getTranslate("reScan"),
                        color: AppColors.mainBlue,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
