import 'package:e_mobiz/common/utils/shared_manager.dart';
import 'package:e_mobiz/dj/injection/injection.dart';

class ComponentsModule extends DIModule{
  @override
  provides() async{
    Injection.getIt.registerSingleton(SharedManager());
    await Injection.getIt<SharedManager>().init();
  }
}