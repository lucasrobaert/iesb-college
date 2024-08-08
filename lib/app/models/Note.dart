import 'package:iesb_college/app/models/Course.dart';

class Note {
  static const tableName = 'TbNote';
  static const columnValue = 'value';
  static const columnCourse = 'course';
  static const columnId = 'id';

  int? id;
  double? value;
  Course? course;
  int? courseId = 0;

  Note({this.id, required this.value, this.course, this.courseId});

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnValue: value,
      columnCourse: courseId,
    };
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      value: map['value'],
      //course: Course.fromMap(map['course']),
      //courseId: map['course'],
    );
  }

  static Note fromMapInnerJoin(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      value: map['value'],
      course: Course.fromMap(map['course']),
      courseId: map['course.id'],
    );
  }
}
