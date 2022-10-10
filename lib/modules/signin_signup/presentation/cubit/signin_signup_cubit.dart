import 'package:bloc/bloc.dart';

import '../../../../utils/mixins/validation_mixins.dart';
import '../bloc/sign_in_sign_up_bloc.dart';

class SignInSignUpCubit extends Cubit<SignInSignUpState> {
  SignInSignUpCubit() : super(SignInSignUpInitial());

  /// Validate form login

  validateFieldUsername(String value) {
    emit(FieldUsernameValidState(errorMessageUsername: ValidationMixins().validateFieldUserName(value)));
  }

  validateFieldPassword(String value) {
    emit(FieldPasswordValidState(errorMessagePassword: ValidationMixins().validateFieldPassword(value)));
  }

  bool submitFormLogin(String email, String password) {
    String errorMessageEmail = ValidationMixins().validateFieldUserName(email);
    String errorMessagePassword = ValidationMixins().validateFieldPassword(password);
    if (ValidationMixins().checkAllowSubmitForm([
      email,
      password,
    ], [
      errorMessageEmail,
      errorMessagePassword,
    ])) {
      return true;
    } else {
      emit(FieldUsernameValidState(errorMessageUsername: errorMessageEmail));
      emit(FieldPasswordValidState(errorMessagePassword: errorMessagePassword));
      return false;
    }
  }
}
