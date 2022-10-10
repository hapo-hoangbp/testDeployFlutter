import 'package:flutter/material.dart';
import 'package:my_home_doctor/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class ItemCardHistoryWidget extends StatelessWidget {
  const ItemCardHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextWidget(
              text: "Test",
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
          ),
          Image.asset(
            "assets/images/card_example.jpeg",
            width: 25.w,
          ),
        ],
      ),
    );
  }
}
