import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/models/Course.dart';
import 'package:iesb_college/app/modules/course/course_module.dart';
import 'package:iesb_college/app/modules/course/course_page.dart';
import 'package:iesb_college/app/modules/course/course_store.dart';
import 'package:iesb_college/app/modules/course/models/course_dto.dart';
import 'package:iesb_college/app/modules/home/home_store.dart';
import 'package:iesb_college/app/modules/home/widgets/botton_navigation.dart';
import 'package:iesb_college/app/modules/report/report_module.dart';
import 'package:iesb_college/app/modules/report/report_page.dart';
import 'package:iesb_college/app/shared/ui_helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<HomeStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('IESB College'),
        elevation: 3,
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: '1',
                child: Text('Nova materia'),
              ),
            ],
          )
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: store.pageController,
        children: [CoursePage(), ReportPage()],
      ),
      bottomNavigationBar: const BottomNavigationIesb(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dialogBuilder(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    final store = context.watch<CourseStore>();
    CourseDTO course = CourseDTO();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar curso'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Nome do curso',
                ),
                keyboardType: TextInputType.name,
                onChanged: (String value) {
                  course.name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Do professor',
                ),
                keyboardType: TextInputType.name,
                onChanged: (String value) {
                  course.teacher = value;
                },
              ),
              DropdownButton(
                hint: const Text('Selecione o tipo de curso'),
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text("Bimestral"),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text("Semestral"),
                  )
                ],
                value: course.type,
                onChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      course.type = value;
                    });
                  }
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Salvar'),
              onPressed: () {
                store.addCourse(course);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
