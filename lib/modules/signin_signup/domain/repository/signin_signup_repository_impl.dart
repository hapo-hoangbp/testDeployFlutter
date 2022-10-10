import 'package:async/async.dart';
import 'package:my_home_doctor/modules/signin_signup/domain/repository/signin_signup_repository.dart';
import 'package:my_home_doctor/utils/services/local_storage_service.dart';
import '../../data/signin_signup_datasource.dart';

class SignInSignUpRepositoryImpl implements SignInSignUpRepository {
  final SignInSignUpDataSource signInSignUpDataSource;

  SignInSignUpRepositoryImpl({required this.signInSignUpDataSource});

  @override
  Future<Result<String>> login(String email, String password) async {
    // TODO: implement login
    return await signInSignUpDataSource.login(email, password).then((value) {
      if (value.isValue) {
        // Save token to local
        print('Token');
        LocalStorageService().setDataLocal("token", value.asValue!.value.token);
        return Result.value("loginSuccess");
      } else {
        return Result.error(value.asError!.error.toString());
      }
    });
  }
}
