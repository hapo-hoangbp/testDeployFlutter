import 'package:my_home_doctor/modules/account/data/account_datasource.dart';

import 'account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountDataSource? accountDataSource;

  AccountRepositoryImpl({this.accountDataSource});
}
