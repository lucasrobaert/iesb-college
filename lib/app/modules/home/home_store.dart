import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iesb_college/app/datasources/local/course_helper.dart';
import 'package:iesb_college/app/models/Course.dart';
import 'package:iesb_college/app/modules/course/models/course_dto.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  var pageController = PageController();
  final _courseHelp = CourseHelper();

  @observable
  int value = 0;

  @observable
  int currentButtonNavigation = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void updateCurrentButtonNavigation(int index) {
    pageController.jumpToPage(index);
    currentButtonNavigation = index;
  }
}
