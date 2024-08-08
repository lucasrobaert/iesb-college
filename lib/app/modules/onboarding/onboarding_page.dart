import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/shared/ui_helpers.dart';
import 'package:iesb_college/app/shared/util/constants/routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Modular.to.navigate('${Routes.home}${Routes.initial}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('IESB College - Notas'),
            verticalSpaceSmall,
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
