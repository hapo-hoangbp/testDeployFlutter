import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../configs/themes/app_colors.dart';

class IconPopScreenWidget extends StatelessWidget {
  final Function? callBack;

  const IconPopScreenWidget({Key? key, this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (callBack != null) {
          callBack!();
        }
      },
      child: Icon(
        Icons.arrow_back,
        size: 18.sp,
        color: AppColors.mainBlue,
      ),
    );
  }
}
