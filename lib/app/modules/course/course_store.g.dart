// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CourseStore on _CourseStoreBase, Store {
  late final _$valueAtom =
      Atom(name: '_CourseStoreBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$coursesAtom =
      Atom(name: '_CourseStoreBase.courses', context: context);

  @override
  List<Course> get courses {
    _$coursesAtom.reportRead();
    return super.courses;
  }

  @override
  set courses(List<Course> value) {
    _$coursesAtom.reportWrite(value, super.courses, () {
      super.courses = value;
    });
  }

  late final _$notesAtom =
      Atom(name: '_CourseStoreBase.notes', context: context);

  @override
  List<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(List<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$_CourseStoreBaseActionController =
      ActionController(name: '_CourseStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_CourseStoreBaseActionController.startAction(
        name: '_CourseStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CourseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void list() {
    final _$actionInfo = _$_CourseStoreBaseActionController.startAction(
        name: '_CourseStoreBase.list');
    try {
      return super.list();
    } finally {
      _$_CourseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save(Course course) {
    final _$actionInfo = _$_CourseStoreBaseActionController.startAction(
        name: '_CourseStoreBase.save');
    try {
      return super.save(course);
    } finally {
      _$_CourseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getNotes(int id) {
    final _$actionInfo = _$_CourseStoreBaseActionController.startAction(
        name: '_CourseStoreBase.getNotes');
    try {
      return super.getNotes(id);
    } finally {
      _$_CourseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNote(NoteDTO note) {
    final _$actionInfo = _$_CourseStoreBaseActionController.startAction(
        name: '_CourseStoreBase.addNote');
    try {
      return super.addNote(note);
    } finally {
      _$_CourseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearNotes() {
    final _$actionInfo = _$_CourseStoreBaseActionController.startAction(
        name: '_CourseStoreBase.clearNotes');
    try {
      return super.clearNotes();
    } finally {
      _$_CourseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCourse(CourseDTO course) {
    final _$actionInfo = _$_CourseStoreBaseActionController.startAction(
        name: '_CourseStoreBase.addCourse');
    try {
      return super.addCourse(course);
    } finally {
      _$_CourseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
courses: ${courses},
notes: ${notes}
    ''';
  }
}
