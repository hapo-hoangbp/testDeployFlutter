import 'package:get_it/get_it.dart';
import '../../modules/signin_signup/data/signin_signup_datasource.dart';
import '../../modules/signin_signup/data/signin_signup_datasource_impl.dart';
import '../../modules/signin_signup/domain/repository/signin_signup_repository.dart';
import '../../modules/signin_signup/domain/repository/signin_signup_repository_impl.dart';
import '../../modules/signin_signup/presentation/bloc/sign_in_sign_up_bloc.dart';

GetIt getIt = GetIt.instance;

Future<void> configDependencies() async {
  _registerDataSource();
  _registerRepository();
  _registerBloc();
}

void _registerDataSource() async {
  getIt.registerFactory<SignInSignUpDataSource>(
    () => SignInSignUpDataSourceImpl(),
  );
}

void _registerRepository() {
  getIt.registerFactory<SignInSignUpRepository>(
    () => SignInSignUpRepositoryImpl(
      signInSignUpDataSource: getIt<SignInSignUpDataSource>(),
    ),
  );
}

void _registerBloc() {
  getIt.registerLazySingleton(
    () => SignInSignUpBloc(
      signInSignUpRepository: getIt<SignInSignUpRepository>(),
    ),
  );
}
