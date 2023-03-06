import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'todo_form.dart';
import 'todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoList(),
      getPages: [
        GetPage(
          name: '/add',
          page: () => TodoForm(),
        ),
      ],
    );
  }
}
