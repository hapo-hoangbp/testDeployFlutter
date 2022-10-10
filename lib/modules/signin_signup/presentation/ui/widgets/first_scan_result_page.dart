import 'package:flutter/material.dart';
import 'package:my_home_doctor/global_widgets/button_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../configs/languages/applocalization.dart';
import '../../../../../configs/routers/app_name_routes.dart';
import '../../../../../configs/themes/app_colors.dart';
import '../../../../../global_widgets/text_widget.dart';

class FirstScanResultPage extends StatelessWidget {
  const FirstScanResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          width: 100.w,
          height: 100.h,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: AppLocalizations.of(context).getTranslate("questionSubmitCardFirstScan"),
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  maxLine: 2,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 80.w,
                  height: 35.h,
                  color: Colors.blueAccent,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                  child: ButtonWidget(
                    // callBack: () => Navigator.of(context).pushNamed(AppNameRoutes.CREATE_ACCOUNT),
                    title: AppLocalizations.of(context).getTranslate("sureCardFirstScan"),
                    backgroundButton: AppColors.mainBlue,
                    backgroundTitle: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: TextWidget(
                    text: AppLocalizations.of(context).getTranslate("firstScanAgain"),
                    color: AppColors.mainBlue,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
