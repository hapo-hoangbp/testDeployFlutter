import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_home_doctor/utils/di/dependency_injection.dart';
import 'package:sizer/sizer.dart';

import 'configs/languages/applocalization.dart';
import 'configs/routers/app_router.dart';
import 'modules/signin_signup/presentation/bloc/sign_in_sign_up_bloc.dart';
import 'modules/signin_signup/presentation/cubit/signin_signup_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configDependencies();
  await Future.delayed(const Duration(seconds: 1));
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<SignInSignUpBloc>.value(value: getIt<SignInSignUpBloc>()),
      BlocProvider<SignInSignUpCubit>.value(value: SignInSignUpCubit()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return MaterialApp(
          title: 'Hapo Myhome Doctor',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          locale: const Locale("en", ""),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("en", ""),
          ],
          onGenerateRoute: (route) => AppRouter().onGenerateRoute(route),
        );
      },
    );
  }
}
