//DTO igual ao model, mas sem métodos e null
import 'package:iesb_college/app/models/Course.dart';

class CourseDTO {
  int? id;
  String? name;
  String? teacher;
  int? type;
  double? media;

  CourseDTO();

  // toModel tranforma DTO em Model Course
  Course toModel() {
    return Course(
      id: id,
      name: name!,
      teacher: teacher!,
      type: type!,
      media: media,
    );
  }
}
