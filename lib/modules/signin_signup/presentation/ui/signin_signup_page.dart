import 'package:flutter/material.dart';
import 'package:my_home_doctor/configs/languages/applocalization.dart';
import 'package:my_home_doctor/configs/themes/app_colors.dart';
import 'package:my_home_doctor/global_widgets/button_widget.dart';
import 'package:my_home_doctor/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../configs/routers/app_name_routes.dart';

const List<String> list = <String>['123', 'Two', 'Three', 'Four'];

class SignInSignUpPage extends StatefulWidget {
  const SignInSignUpPage({Key? key}) : super(key: key);

  @override
  State<SignInSignUpPage> createState() => _SignInSignUpPageState();
}

class _SignInSignUpPageState extends State<SignInSignUpPage> {
  static String tag = 'login-page';
  bool isChecked = false;
  final Color backgroundColor1 = Color(0xFF4aa0d5);
  final Color backgroundColor2 = Color(0xFF4aa0d5);
  final Color highlightColor = Color(0xfff65aa3);
  final Color foregroundColor = Colors.white;

  String dropdownValue = list.first;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: const Alignment(1.0, 0.0),
            // 10% of the width, so there are ten blinds.
            colors: [highlightColor, backgroundColor2],
            // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    TextWidget(
                      text: 'Welcome to \n My home doctor',
                      fontSize: 20.sp,
                      maxLine: 2,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.only(left: 40.0, right: 40.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: foregroundColor ?? Colors.white),
                borderRadius: BorderRadius.circular(60),
                // border: Border(
                //   bottom: BorderSide(color: foregroundColor, width: 0.5, style: BorderStyle.solid),
                // ),
              ),
              padding: const EdgeInsets.only(left: 16.0, right: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your ID...',
                        hintStyle: TextStyle(color: foregroundColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: foregroundColor ?? Colors.white),
                borderRadius: BorderRadius.circular(60),
                // border: Border(
                //   bottom: BorderSide(color: foregroundColor, width: 0.5, style: BorderStyle.solid),
                // ),
              ),
              padding: const EdgeInsets.only(left: 16.0, right: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your Date of Birth...',
                        hintStyle: TextStyle(color: foregroundColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                TextWidget(
                  text: '次回から自動的にログインする',
                  fontSize: 12.sp,
                  color: foregroundColor,
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                      color: Colors.lightBlue,
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: foregroundColor),
                      ),
                      // Perform some action
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                      color: Colors.transparent,
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(color: foregroundColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                      color: Colors.transparent,
                      child: Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(color: foregroundColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
