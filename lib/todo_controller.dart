import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'todo_model.dart';
import 'dart:convert';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadTodos();
  }

  void add(String text) {
    todos.add(Todo(
      text: text,
      completed: false.obs,
    ));
    _saveTodos();
  }

  void remove(int index) {
    todos.removeAt(index);
    _saveTodos();
  }

  void toggle(int index) {
    todos[index].completed.toggle();
    todos[index].completed.refresh();
    _saveTodos();
  }

  void _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todoList = todos.map((todo) => todo.toMap()).toList();
    await prefs.setString('todos', jsonEncode(todoList));
  }

  void _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todoList = prefs.getString('todos');
    if (todoList != null) {
      final decoded = jsonDecode(todoList) as List<dynamic>;
      todos.assignAll(decoded.map((todo) => Todo.fromMap(todo)).toList());
    }
  }
}