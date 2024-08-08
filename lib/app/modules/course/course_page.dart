import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/modules/course/course_store.dart';
import 'package:iesb_college/app/shared/ui_helpers.dart';
import 'package:iesb_college/app/shared/util/constants/routes.dart';
import 'package:mobx/mobx.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  var store = Modular.get<CourseStore>();
  late final ReactionDisposer _disposer;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Modular.to.navigate('${Routes.home}${Routes.initial}');
    });
    store.list();

    _disposer = when((_) => store.courses.isNotEmpty, () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Essas são suas matérias cadastradas',
              style: TextStyle(fontSize: 22),
            ),
            verticalSpaceSmall,
            const Text(
              'Clique em uma matéria para ver mais detalhes',
              style: TextStyle(fontSize: 16),
            ),
            verticalSpaceMedium,
            Expanded(
              child: Observer(builder: (context) {
                return ListView.builder(
                  itemCount: store.courses.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(store.courses[index].name),
                        subtitle: Text(store.courses[index].teacher),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Modular.to.pushNamed(
                              '${Routes.course}${Routes.notes}',
                              arguments: store.courses[index]);
                        },
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
