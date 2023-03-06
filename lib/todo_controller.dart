import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'todo_model.dart';

class TodoController extends GetxController {
  final todos = <Todo>[].obs;

  void add(String text) {
    todos.add(Todo(text: text));
  }

  void remove(int index) {
    todos.removeAt(index);
  }

  void toggle(int index) {
    todos[index].completed.toggle();
    todos[index].completed.refresh();
    print('Todo completed state updated: ${todos[index].completed.value}');
  }


  void clear() {
    todos.clear();
  }
}
