import 'package:flutter/material.dart';
import 'package:my_home_doctor/configs/languages/applocalization.dart';
import 'package:my_home_doctor/global_widgets/button_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../configs/routers/app_name_routes.dart';
import '../../../../../configs/themes/app_colors.dart';
import '../../../../../global_widgets/text_widget.dart';

class CreateAccountConfirmSuccessPage extends StatelessWidget {
  const CreateAccountConfirmSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: 100.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/create_account_success_image.jpeg",
                width: 40.w,
                height: 40.w,
              ),
              TextWidget(
                text: AppLocalizations.of(context).getTranslate("createAccountSuccess"),
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 5.h,
              ),
              TextWidget(
                text: AppLocalizations.of(context).getTranslate("thankForUsingApp"),
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                maxLine: 2,
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 5.h),
              //   child: ButtonWidget(
              //     callBack: () => Navigator.of(context).pushNamed(AppNameRoutes.ACCOUNT_SETUP_STEP1),
              //     title: "OK",
              //     backgroundTitle: Colors.white,
              //     backgroundButton: AppColors.mainBlue,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
