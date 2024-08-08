import 'package:mobx/mobx.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStoreBase with _$OnboardingStore;

abstract class _OnboardingStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
