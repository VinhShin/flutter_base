import 'package:dio/dio.dart';
import 'package:e_mobiz/data/remote/repo/account/account_repository.dart';
import 'package:e_mobiz/dj/injection/injection.dart';

class RepoModule extends DIModule {

  @override
  provides() async {
    Injection.getIt.registerLazySingleton<AccountRepo>(() =>
        AccountRepoImpl(dio: Injection.getIt<Dio>()));
  }
}