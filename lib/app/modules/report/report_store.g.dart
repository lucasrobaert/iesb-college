// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReportStore on _ReportStoreBase, Store {
  late final _$valueAtom =
      Atom(name: '_ReportStoreBase.value', context: context);

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
      Atom(name: '_ReportStoreBase.courses', context: context);

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

  late final _$reportsAtom =
      Atom(name: '_ReportStoreBase.reports', context: context);

  @override
  List<ReportDto> get reports {
    _$reportsAtom.reportRead();
    return super.reports;
  }

  @override
  set reports(List<ReportDto> value) {
    _$reportsAtom.reportWrite(value, super.reports, () {
      super.reports = value;
    });
  }

  late final _$getReportAsyncAction =
      AsyncAction('_ReportStoreBase.getReport', context: context);

  @override
  Future<void> getReport() {
    return _$getReportAsyncAction.run(() => super.getReport());
  }

  late final _$_ReportStoreBaseActionController =
      ActionController(name: '_ReportStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_ReportStoreBaseActionController.startAction(
        name: '_ReportStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ReportStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearReports() {
    final _$actionInfo = _$_ReportStoreBaseActionController.startAction(
        name: '_ReportStoreBase.clearReports');
    try {
      return super.clearReports();
    } finally {
      _$_ReportStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
courses: ${courses},
reports: ${reports}
    ''';
  }
}
