import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/modules/onboarding/onboarding_page.dart';
import 'package:iesb_college/app/shared/util/constants/routes.dart';

class OnboardingModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
  }

  @override
  void routes(r) {
    r.child(
      Routes.initial,
      child: (ctx) => const OnboardingPage(),
      transition: TransitionType.fadeIn,
    );
  }
}
