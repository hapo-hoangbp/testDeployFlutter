import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_home_doctor/configs/languages/applocalization.dart';
import 'package:my_home_doctor/configs/routers/app_name_routes.dart';
import 'package:my_home_doctor/configs/themes/app_colors.dart';
import 'package:my_home_doctor/global_widgets/icon_pop_screen_widget.dart';
import 'package:my_home_doctor/global_widgets/text_form_field_widget.dart';
import 'package:my_home_doctor/global_widgets/text_widget.dart';
import 'package:my_home_doctor/modules/signin_signup/presentation/bloc/sign_in_sign_up_bloc.dart';
import 'package:my_home_doctor/modules/signin_signup/presentation/cubit/signin_signup_cubit.dart';
import 'package:my_home_doctor/utils/helpers/app_helpers.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/ui/dialog_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _focusNodePassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.backgroundWhite,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1.5,
              title: TextWidget(
                text: AppLocalizations.of(context).getTranslate("login"),
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              centerTitle: false,
              leading: IconPopScreenWidget(callBack: () => Navigator.of(context).pop()),
            ),
            body: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<SignInSignUpCubit, SignInSignUpState>(
                      buildWhen: (previous, current) => current is FieldUsernameValidState,
                      builder: (context, state) {
                        return TextFormFieldWidget(
                          controller: _usernameController,
                          focusNodeNext: _focusNodePassword,
                          hintText: AppLocalizations.of(context).getTranslate("hintFieldUsername"),
                          callBackOnChange: (value) => context.read<SignInSignUpCubit>().validateFieldUsername(value),
                          callBackComplete: (value) => context.read<SignInSignUpCubit>().validateFieldUsername(value),
                          errorMessageValidate: state is FieldUsernameValidState
                              ? AppHelpers().convertDataMultiLanguage(context, state.errorMessageUsername)
                              : "",
                        );
                      },
                    ),
                    BlocBuilder<SignInSignUpCubit, SignInSignUpState>(
                      buildWhen: (previous, current) => current is FieldPasswordValidState,
                      builder: (context, state) {
                        return TextFormFieldWidget(
                          controller: _passwordController,
                          focusNode: _focusNodePassword,
                          focusNodeNext: null,
                          hintText: AppLocalizations.of(context).getTranslate("hintFieldPassword"),
                          callBackOnChange: (value) => context.read<SignInSignUpCubit>().validateFieldPassword(value),
                          callBackComplete: (value) => context.read<SignInSignUpCubit>().validateFieldPassword(value),
                          errorMessageValidate: state is FieldPasswordValidState
                              ? AppHelpers().convertDataMultiLanguage(context, state.errorMessagePassword)
                              : "",
                        );
                      },
                    ),
                    BlocConsumer<SignInSignUpBloc, SignInSignUpState>(
                      listenWhen: (previous, current) => current is LoginSuccessState || current is LoginFailState,
                      listener: (context, state) {
                        String message = "";
                        if (state is LoginSuccessState) {
                          _usernameController.text = "";
                          _passwordController.text = "";
                          message = state.message ?? "";
                        } else if (state is LoginFailState) {
                          message = state.message ?? "";
                        }
                        DialogUtils.showNotificationDialog(
                          context: context,
                          message: AppLocalizations.of(context).getTranslate(message),
                          callBackButtonClose: state is LoginSuccessState
                              ? () => Navigator.of(context).pushNamed(
                                    AppNameRoutes.MAIN_APP,
                                  )
                              : null,
                        );
                      },
                      buildWhen: (previous, current) =>
                          current is LoginLoadingState || current is LoginSuccessState || current is LoginFailState,
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            if (state is! LoginLoadingState) {
                              if (context
                                  .read<SignInSignUpCubit>()
                                  .submitFormLogin(_usernameController.text, _passwordController.text)) {
                                context.read<SignInSignUpBloc>().add(
                                    LoginEvent(email: _usernameController.text, password: _passwordController.text));
                              }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 80.w,
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: AppColors.mainBlue,
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: BlocBuilder<SignInSignUpBloc, SignInSignUpState>(
                              buildWhen: (previous, current) =>
                                  current is LoginLoadingState ||
                                  current is LoginSuccessState ||
                                  current is LoginFailState,
                              builder: (context, state) {
                                return state is LoginLoadingState
                                    ? SpinKitFadingCircle(
                                        size: 15.sp,
                                        color: Colors.white,
                                      )
                                    : TextWidget(
                                        text: AppLocalizations.of(context).getTranslate("login"),
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      // onTap: () => Navigator.of(context).pushNamed(AppNameRoutes.FIRST_SCAN),
                      child: TextWidget(
                        text: AppLocalizations.of(context).getTranslate("isNotHaveAccount"),
                        color: AppColors.mainBlue,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "----------",
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          TextWidget(
                            text: " ${AppLocalizations.of(context).getTranslate("or")} ",
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          TextWidget(
                            text: "----------",
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 80.w,
                        padding: EdgeInsets.symmetric(vertical: 1.5.h),
                        margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 2.h),
                        decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: TextWidget(
                          text: AppLocalizations.of(context).getTranslate("loginWithGmail"),
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
