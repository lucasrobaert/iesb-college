import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/modules/course/course_module.dart';
import 'package:iesb_college/app/modules/home/home_module.dart';
import 'package:iesb_college/app/modules/onboarding/onboarding_page.dart';
import 'package:iesb_college/app/modules/report/report_module.dart';
import 'package:iesb_college/app/shared/util/constants/routes.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
        CourseModule(),
        ReportModule(),
      ];

  @override
  void binds(Injector i) {
    i.addInstance(SharedPreferences.getInstance());
    super.binds(i);
  }

  @override
  void routes(r) {
    r.child(
      Routes.onboarding,
      child: (ctx) => const OnboardingPage(),
      transition: TransitionType.fadeIn,
    );
    //r.module(Routes.onboarding, module: OnboardingModule());
    r.module(Routes.home, module: HomeModule());
    r.module(Routes.course, module: CourseModule());
    r.module(Routes.reports, module: ReportModule());
  }
}
