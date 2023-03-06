import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'todo_controller.dart';

class TodoForm extends HookWidget {
  final todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Todo'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  todoController.add(textController.text);
                  textController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
