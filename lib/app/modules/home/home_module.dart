import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/modules/home/home_page.dart';
import 'package:iesb_college/app/modules/home/home_store.dart';
import 'package:iesb_college/app/shared/util/constants/routes.dart';

class HomeModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(HomeStore.new);
    super.exportedBinds(i);
  }

  @override
  void routes(r) {
    r.child(
      Routes.initial,
      child: (ctx) => const HomePage(),
      transition: TransitionType.fadeIn,
    );
  }
}
