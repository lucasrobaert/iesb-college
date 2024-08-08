import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/modules/course/course_page.dart';
import 'package:iesb_college/app/modules/course/course_store.dart';
import 'package:iesb_college/app/modules/course/pages/notes_page.dart';
import 'package:iesb_college/app/shared/util/constants/routes.dart';

class CourseModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(CourseStore.new);

    super.exportedBinds(i);
  }

  @override
  void routes(r) {
    r.child(
      Routes.initial,
      child: (ctx) => const CoursePage(),
      transition: TransitionType.fadeIn,
    );
    r.child(
      Routes.notes,
      child: (ctx) => NotesPage(
        course: r.args.data,
      ),
      transition: TransitionType.fadeIn,
    );
  }
}
