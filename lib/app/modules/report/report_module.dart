import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/modules/report/report_page.dart';
import 'package:iesb_college/app/modules/report/report_store.dart';
import 'package:iesb_college/app/shared/util/constants/routes.dart';

class ReportModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(ReportStore.new);

    super.exportedBinds(i);
  }

  @override
  void routes(r) {
    r.child(
      Routes.initial,
      child: (ctx) => const ReportPage(),
      transition: TransitionType.fadeIn,
    );
  }
}
