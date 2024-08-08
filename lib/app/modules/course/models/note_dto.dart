import 'package:iesb_college/app/models/Note.dart';

class NoteDTO {
  int? id;
  int? courseId;
  double? value;

  NoteDTO();

  // toModel tranforma DTO em Model Course
  Note toModel() {
    return Note(
      id: id,
      courseId: courseId!,
      value: value!,
    );
  }
}
