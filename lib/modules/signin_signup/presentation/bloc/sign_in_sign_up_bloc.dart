import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/repository/signin_signup_repository.dart';

part 'sign_in_sign_up_event.dart';

part 'sign_in_sign_up_state.dart';

class SignInSignUpBloc extends Bloc<SignInSignUpEvent, SignInSignUpState> {
  SignInSignUpBloc({this.signInSignUpRepository}) : super(SignInSignUpInitial()) {
    on<LoginEvent>(_login);
  }

  final SignInSignUpRepository? signInSignUpRepository;

  _login(LoginEvent event, Emitter<SignInSignUpState> emit) async {
    emit(LoginLoadingState());
    await signInSignUpRepository!.login(event.email, event.password).then((value) {
      if (value.isValue) {
        emit(LoginSuccessState(message: value.asValue!.value));
      } else {
        emit(LoginFailState(message: value.asError!.error.toString()));
      }
    });
  }
}
