part of 'sign_in_sign_up_bloc.dart';

abstract class SignInSignUpState extends Equatable {
  const SignInSignUpState();
}

class SignInSignUpInitial extends SignInSignUpState {
  @override
  List<Object> get props => [];
}

/// Validate field in form log in

class FieldUsernameValidState extends SignInSignUpState {
  const FieldUsernameValidState({required this.errorMessageUsername});

  final String? errorMessageUsername;

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessageUsername];
}

class FieldPasswordValidState extends SignInSignUpState {
  const FieldPasswordValidState({required this.errorMessagePassword});

  final String? errorMessagePassword;

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessagePassword];
}

/// Log in

class LoginLoadingState extends SignInSignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessState extends SignInSignUpState {
  const LoginSuccessState({required this.message});

  final String? message;

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class LoginFailState extends SignInSignUpState {
  const LoginFailState({required this.message});

  final String? message;

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
