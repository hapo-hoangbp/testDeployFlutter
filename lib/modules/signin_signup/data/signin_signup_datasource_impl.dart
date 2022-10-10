import 'package:dio/dio.dart';
import 'package:async/async.dart';
import 'package:my_home_doctor/constants/api_path.dart';
import 'package:my_home_doctor/modules/signin_signup/data/signin_signup_datasource.dart';
import 'package:my_home_doctor/modules/signin_signup/domain/entities/login_model.dart';
import 'package:my_home_doctor/utils/services/rest_api_service.dart';

class SignInSignUpDataSourceImpl implements SignInSignUpDataSource {
  @override
  Future<Result<LoginResponseModel>> login(String email, String password) async {
    // TODO: implement login
    final result = await RestApiService().post(
      ApiPath().hostAPI + ApiPath().apiLogin,
      {
        "args": [],
        "fields": {"username": email, "password": password}
      },
    );
    if (result.isValue) {
      return Result.value(LoginResponseModel.fromJson(result.asValue!.value));
    } else {
      return Result.error("loginFail");
    }
  }
}
