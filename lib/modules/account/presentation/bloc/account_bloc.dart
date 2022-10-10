import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_home_doctor/modules/account/domain/repository/account_repository.dart';

part 'account_event.dart';

part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({this.accountRepository}) : super(AccountInitial()) {
    on<AccountEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final AccountRepository? accountRepository;
}
