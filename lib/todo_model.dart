import 'package:get/get.dart';

class Todo {
  String text;
  RxBool completed;

  Todo({
    required this.text,
    required this.completed,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'completed': completed.value,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      text: map['text'],
      completed: RxBool(map['completed']),
    );
  }
}
