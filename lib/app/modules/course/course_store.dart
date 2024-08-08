import 'package:iesb_college/app/datasources/local/course_helper.dart';
import 'package:iesb_college/app/datasources/local/note_helper.dart';
import 'package:iesb_college/app/models/Course.dart';
import 'package:iesb_college/app/models/Note.dart';
import 'package:iesb_college/app/modules/course/models/course_dto.dart';
import 'package:iesb_college/app/modules/course/models/note_dto.dart';
import 'package:mobx/mobx.dart';

part 'course_store.g.dart';

class CourseStore = _CourseStoreBase with _$CourseStore;

abstract class _CourseStoreBase with Store {
  @observable
  int value = 0;

  @observable
  List<Course> courses = [];

  @observable
  List<Note> notes = [];

  final _helper = CourseHelper();
  final _notesHelper = NoteHelper();

  @action
  void increment() {
    value++;
  }

  @action
  void list() {
    _helper.listAll().then((value) {
      courses = value;
    });
  }

  @action
  void save(Course course) {
    courses.clear();
    _helper.inserir(course);
    list();
  }

  @action
  void getNotes(int id) {
    _notesHelper.getTodosPorCurso(id).then((value) {
      notes = value;
    });
  }

  @action
  void addNote(NoteDTO note) {
    _notesHelper.inserir(note.toModel());
    getNotes(note.courseId!);
  }

  @action
  void clearNotes() {
    notes = [];
  }

  @action
  void addCourse(CourseDTO course) {
    courses.clear();
    _helper.inserir(course.toModel());
    list();
  }

  double calculateAverage() {
    if (notes.isEmpty) {
      return 0;
    }
    double sum =
        notes.fold(0, (previousValue, note) => previousValue + note.value!);
    return sum / notes.length;
  }
}
