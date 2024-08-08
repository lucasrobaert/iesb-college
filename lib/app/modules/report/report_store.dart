import 'package:iesb_college/app/datasources/local/course_helper.dart';
import 'package:iesb_college/app/models/Course.dart';
import 'package:iesb_college/app/modules/report/dtos/report_dto.dart';
import 'package:mobx/mobx.dart';

part 'report_store.g.dart';

class ReportStore = _ReportStoreBase with _$ReportStore;

abstract class _ReportStoreBase with Store {
  @observable
  int value = 0;

  var _helper = CourseHelper();

  @observable
  List<Course> courses = [];

  @observable
  List<ReportDto> reports = [];

  @action
  void increment() {
    value++;
  }

  @action
  Future<void> getReport() async {
    try {
      List<Course> coursesFromDb = await _helper.listAllInnerJoin();

      reports.clear();

      Map<String, ReportDto> cursos = {};

      for (var course in coursesFromDb) {
        String courseName = course.name;
        double note = course.note?.value ?? 0;

        if (cursos.containsKey(courseName)) {
          cursos[courseName]?.notas.add(note);
        } else {
          cursos[courseName] = ReportDto(course.id!, courseName, 0, [note]);
        }
      }

      cursos.forEach((name, report) {
        double sum = report.notas.reduce((a, b) => a + b);
        double average = sum / report.notas.length;
        report.media = double.parse(average.toStringAsFixed(2));
        report.status = report.media >= 5 ? 'Aprovado' : 'Reprovado';
      });

      reports.addAll(cursos.values);
    } catch (e) {
      print('Erro ao obter relatórios: $e');
    }
  }

  @action
  void clearReports() {
    reports = [];
  }
}
