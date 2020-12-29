

import 'package:e_mobiz/common/utils/shared_manager.dart';
import 'package:e_mobiz/data/remote/repo/account/account_repository.dart';
import 'package:e_mobiz/data/remote/use_case/user_usecase.dart';
import 'package:e_mobiz/dj/injection/injection.dart';

class UseCaseModule extends DIModule {

  @override
  provides() async {
    Injection.getIt.registerLazySingleton<AccountUseCase>(() =>
        AccountUseCaseImpl(
            accountRepo: Injection.getIt<AccountRepo>(),
            shared: Injection.getIt<SharedManager>(),
        ));
  }

}