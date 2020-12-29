import 'package:e_mobiz/dj/module/api_module.dart';
import 'package:e_mobiz/dj/module/bloc_module.dart';
import 'package:e_mobiz/dj/module/components_module.dart';
import 'package:e_mobiz/dj/module/repo_module.dart';
import 'package:e_mobiz/dj/module/usecase_module.dart';
import 'package:get_it/get_it.dart';
abstract class DIModule{
  provides();
}

class Injection {
  static final getIt = GetIt.instance;

  static Future inject() async {
    await ComponentsModule().provides();
    await ApiModule().provides();
    await RepoModule().provides();
    await UseCaseModule().provides();
    await BlocModule().provides();
  }

//  static Future prepareData() async {
//    await Injection.getIt<Services>().setAppConfig(BuildConfig.get().serverConfig);
//    await Injection.getIt<AppBloc>().init();
//    await Injection.getIt<NavigationBloc>().init();
//    await Injection.getIt<WishLisBloc>().init();
//
//    if(await Injection.getIt<UserUseCase>().checkLogin()) {
//      Injection.getIt<AccountBloc>().getUser();
//      Injection.getIt<ShoppingCartBloc>().init();
//    }
//  }
}