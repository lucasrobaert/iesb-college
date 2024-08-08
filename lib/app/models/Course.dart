import 'package:iesb_college/app/models/Note.dart';

class Course {
  static const tableName = 'TbCourse';
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnTeacher = 'teacher';
  static const columnType = 'type';
  static const columnMedia = 'media';

  int? id;
  String name;
  String teacher;
  int type;
  double? media;
  Note? note;

  Course(
      {this.id,
      required this.name,
      required this.teacher,
      required this.type,
      this.media,
      this.note});

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnName: name,
      columnTeacher: teacher,
      columnType: type,
      columnMedia: media,
    };
  }

  static Course fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'],
      name: map['name'],
      teacher: map['teacher'],
      type: map['type'],
      media: map['media'],
    );
  }

  static Course fromMapInnerJoin(Map<String, dynamic> map) {
    return Course(
      id: map['id'],
      name: map['name'],
      teacher: map['teacher'],
      type: map['type'],
      media: map['media'],
      note: Note.fromMap(map),
    );
  }
}
