import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/modules/home/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BottomNavigationIesb extends StatefulWidget {
  const BottomNavigationIesb({super.key});

  @override
  State<BottomNavigationIesb> createState() => _BottomNavigationIesbState();
}

class _BottomNavigationIesbState extends State<BottomNavigationIesb> {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<HomeStore>();

    return Observer(
      builder: (BuildContext context) {
        return BottomNavigationBar(
          elevation: 3,
          selectedItemColor: Colors.amber[800],
          currentIndex: store.currentButtonNavigation,
          onTap: (index) {
            store.updateCurrentButtonNavigation(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Relatórios',
            ),
          ],
        );
      },
    );
  }
}
