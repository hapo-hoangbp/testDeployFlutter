import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

import '../../configs/languages/applocalization.dart';
import '../../configs/themes/app_colors.dart';
import '../../global_widgets/text_widget.dart';

class DialogUtils {
  static Future showNotificationDialog({
    required BuildContext context,
    required String? message,
    bool? isHasButtonSubmit,
    Function? callBackButtonClose,
    Function? callBackButtonSubmit,
  }) async {
    await showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              insetPadding: EdgeInsets.all(6.w),
              contentPadding: const EdgeInsets.all(0),
              content: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: TextWidget(
                        text: message,
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        maxLine: 9999,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              if (callBackButtonClose != null) {
                                callBackButtonClose();
                              }
                            },
                            child: TextWidget(
                              text: "Close",
                              color: AppColors.mainBlue,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          isHasButtonSubmit == true
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    if (callBackButtonSubmit != null) {
                                      callBackButtonSubmit();
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5.w),
                                    child: TextWidget(
                                      text: AppLocalizations.of(context).getTranslate("submit"),
                                      color: AppColors.mainBlue,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
    );
  }

  static Future showDialogLoading({
    required BuildContext context,
    required String? message,
  }) async {
    await showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              insetPadding: EdgeInsets.all(6.w),
              contentPadding: const EdgeInsets.all(0),
              content: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: TextWidget(
                        text: message,
                        color: AppColors.mainHintText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        maxLine: 9999,
                      ),
                    ),
                    SpinKitFadingCircle(
                      size: 20.sp,
                      color: AppColors.mainHintText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
    );
  }

  static Future showDialogGeneral({
    required BuildContext context,
    required Widget? widgetContent,
  }) async {
    await showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                insetPadding: EdgeInsets.all(6.w),
                contentPadding: const EdgeInsets.all(0),
                content: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: widgetContent,
                ),
              ),
            ),
          ),
        );
      },
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
    );
  }
}
