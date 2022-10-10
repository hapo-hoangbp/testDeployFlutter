import 'package:flutter/material.dart';
import 'package:my_home_doctor/configs/routers/app_name_routes.dart';
import 'package:my_home_doctor/global_widgets/button_widget.dart';
import 'package:my_home_doctor/global_widgets/text_form_field_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../configs/languages/applocalization.dart';
import '../../../../../configs/themes/app_colors.dart';
import '../../../../../global_widgets/text_widget.dart';

class AccountSetupPage extends StatefulWidget {
  const AccountSetupPage({Key? key}) : super(key: key);

  @override
  State<AccountSetupPage> createState() => _AccountSetupPageState();
}

class _AccountSetupPageState extends State<AccountSetupPage> {
  final TextEditingController _jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
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
                    text: AppLocalizations.of(context).getTranslate("accountSetup"),
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextWidget(
                    text: AppLocalizations.of(context).getTranslate("publicProfile"),
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  TextWidget(
                    text: AppLocalizations.of(context).getTranslate("setupPhotoAndJob"),
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    maxLine: 2,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h, bottom: 2.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.mainBlue.withOpacity(0.2),
                    ),
                    child: Icon(
                      Icons.account_circle,
                      color: AppColors.mainBlue.withOpacity(0.2),
                      size: 20.w,
                    ),
                  ),
                  TextWidget(
                    text: AppLocalizations.of(context).getTranslate("profilePhoto"),
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormFieldWidget(
                    controller: _jobController,
                    titleText: "My Job",
                    hintText: "Job",
                    focusNodeNext: null,
                    isBorderOutLine: true,
                    errorMessageValidate: "",
                    callBackOnChange: null,
                    callBackComplete: null,
                    iconInField: Icon(
                      Icons.mode_edit_outline_outlined,
                      size: 18.sp,
                      color: AppColors.mainBlue,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h, bottom: 4.h),
                    child: ButtonWidget(
                      callBack: () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pushNamed(AppNameRoutes.MAIN_APP);
                      },
                      title: AppLocalizations.of(context).getTranslate("next"),
                      widthButton: 88.w,
                      backgroundButton: AppColors.mainBlue,
                      backgroundTitle: Colors.white,
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
