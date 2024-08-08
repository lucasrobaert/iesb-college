// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$valueAtom = Atom(name: '_HomeStoreBase.value', context: context);

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

  late final _$currentButtonNavigationAtom =
      Atom(name: '_HomeStoreBase.currentButtonNavigation', context: context);

  @override
  int get currentButtonNavigation {
    _$currentButtonNavigationAtom.reportRead();
    return super.currentButtonNavigation;
  }

  @override
  set currentButtonNavigation(int value) {
    _$currentButtonNavigationAtom
        .reportWrite(value, super.currentButtonNavigation, () {
      super.currentButtonNavigation = value;
    });
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCurrentButtonNavigation(int index) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.updateCurrentButtonNavigation');
    try {
      return super.updateCurrentButtonNavigation(index);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
currentButtonNavigation: ${currentButtonNavigation}
    ''';
  }
}
