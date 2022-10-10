import '../domain/entities/login_model.dart';
import 'package:async/async.dart';

abstract class SignInSignUpDataSource {
  Future<Result<LoginResponseModel>> login(String email, String password);
}
