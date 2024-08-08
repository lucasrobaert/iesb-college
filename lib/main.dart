import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/app_module.dart';
import 'package:iesb_college/app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
