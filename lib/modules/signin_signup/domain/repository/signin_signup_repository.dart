import 'package:async/async.dart';

abstract class SignInSignUpRepository {
  Future<Result<String>> login(String email, String password);
}
