import 'package:get/get.dart';

class Todo {
  String text;
  RxBool completed;

  Todo({
    required this.text,
    bool completed = false,
  }) : completed = completed.obs ;
}

