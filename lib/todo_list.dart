import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'todo_controller.dart';

class TodoList extends StatelessWidget {
  final todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: todoController.todos.length,
        itemBuilder: (context, index) {
          final todo = todoController.todos[index];
          return Obx(() => ListTile(
            leading: Checkbox(
              value: todo.completed.value,
              onChanged: (_) => todoController.toggle(index),
            ),
            title: Text(todo.text),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => todoController.remove(index),
            ),
          ));
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.toNamed('/add'),
      ),
    );
  }
}
