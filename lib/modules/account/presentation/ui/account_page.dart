import 'package:flutter/material.dart';
import 'package:my_home_doctor/configs/languages/applocalization.dart';
import 'package:my_home_doctor/configs/themes/app_colors.dart';
import 'package:my_home_doctor/global_widgets/button_widget.dart';
import 'package:my_home_doctor/global_widgets/item_card_history_widget.dart';
import 'package:my_home_doctor/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.9,
          title: TextWidget(
            text: "Test",
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(right: 4.w),
                child: Icon(
                  Icons.settings_outlined,
                  color: AppColors.mainBlue,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: 100.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 3.h, bottom: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.mainBlue.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.account_circle,
                    color: AppColors.mainBlue.withOpacity(0.3),
                    size: 30.w,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2.w),
                  margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.lightBlue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Developer",
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      Icon(
                        Icons.edit_outlined,
                        size: 20.sp,
                        color: AppColors.mainBlue,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 16,
                  color: Colors.grey.withOpacity(0.2),
                ),
                Container(
                  padding: EdgeInsets.all(4.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.credit_card_outlined,
                            size: 16.sp,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          TextWidget(
                            text: AppLocalizations.of(context).getTranslate("cardUsing"),
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              color: AppColors.mainBlue,
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 15.sp,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                TextWidget(
                                  text: AppLocalizations.of(context).getTranslate("addNewCard"),
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.w,
                        margin: EdgeInsets.symmetric(vertical: 2.h),
                        child: Image.asset(
                          "assets/images/card_example_2.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      ButtonWidget(
                        callBack: () {},
                        title: AppLocalizations.of(context).getTranslate("editCard"),
                        backgroundTitle: Colors.white,
                        backgroundButton: AppColors.mainBlue,
                        widthButton: 70.w,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 16,
                  color: Colors.grey.withOpacity(0.2),
                ),
                Container(
                  padding: EdgeInsets.all(4.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.factory,
                            size: 16.sp,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          TextWidget(
                            text: AppLocalizations.of(context).getTranslate("history"),
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(
                          4,
                          (index) => const ItemCardHistoryWidget(),
                        ),
                      ),
                    ],
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
