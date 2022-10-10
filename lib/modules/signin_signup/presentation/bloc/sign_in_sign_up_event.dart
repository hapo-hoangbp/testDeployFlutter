part of 'sign_in_sign_up_bloc.dart';

abstract class SignInSignUpEvent extends Equatable {
  const SignInSignUpEvent();
}

class LoginEvent extends SignInSignUpEvent {
  const LoginEvent({required this.email, required this.password});

  final String email;
  final String password;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
