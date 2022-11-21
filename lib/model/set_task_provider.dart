import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'Task.dart';

class SetTaskProvider extends ChangeNotifier{

  final List<Task> _task = [
    Task(title: 'study',detail: 'lab flutter'),
    Task(title: 'home', detail: 'buy milk'),
    Task(title: 'study',detail: 'lab flutter'),
    Task(title: 'home', detail: 'buy milk'),
    Task(title: 'study',detail: 'lab flutter'),
    Task(title: 'home', detail: 'buy milk'),
    Task(title: 'study',detail: 'lab flutter'),
    Task(title: 'home', detail: 'buy milk'),
  ];

  int get taskCount{
    return _task.length;
  }

  // UnmodifiableListView<Task> get tasks {
  //   return UnmodifiableListView(_task);
  // }

  List<Task> get tasks => _task.where((task) => task.isDone == false).toList();

  List<Task> get taskCompleted => _task.where((task) => task.isDone == true).toList();


  void addTask(String title, String detail){
    final tasks = Task(title: title,detail: detail);
    _task.add(tasks);
    notifyListeners();
  }

  void statusTask(Task task){
    task.taskDone();
    notifyListeners();

  }
}

