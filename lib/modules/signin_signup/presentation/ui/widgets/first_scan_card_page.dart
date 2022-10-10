import 'package:flutter/material.dart';
import 'package:my_home_doctor/global_widgets/button_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../configs/languages/applocalization.dart';
import '../../../../../configs/routers/app_name_routes.dart';
import '../../../../../configs/themes/app_colors.dart';
import '../../../../../global_widgets/icon_pop_screen_widget.dart';
import '../../../../../global_widgets/text_widget.dart';

class FirstScanCardPage extends StatelessWidget {
  const FirstScanCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconPopScreenWidget(
            callBack: () => Navigator.of(context).pop(),
          ),
        ),
        body: SizedBox(
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/first_scan_image.jpeg"),
              TextWidget(
                text: AppLocalizations.of(context).getTranslate("firstScanYourCard"),
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 4.h,
              ),
              TextWidget(
                text: AppLocalizations.of(context).getTranslate("descriptionFirstScan"),
                color: Colors.black,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                maxLine: 9999,
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                child: ButtonWidget(
                  // callBack: () => Navigator.of(context).pushNamed(AppNameRoutes.FIRST_SCAN_RESULT),
                  title: AppLocalizations.of(context).getTranslate("scanMyCard"),
                  backgroundButton: AppColors.mainBlue,
                  backgroundTitle: Colors.white,
                ),
              ),
              InkWell(
                // onTap: () => Navigator.of(context).pushNamed(AppNameRoutes.CREATE_ACCOUNT),
                child: Container(
                  margin: EdgeInsets.only(bottom: 4.h),
                  child: TextWidget(
                    text: AppLocalizations.of(context).getTranslate("isNotHaveCard"),
                    color: AppColors.mainBlue,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
