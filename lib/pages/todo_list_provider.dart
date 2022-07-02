import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_app/models/todo.dart';

class TodoListProvider extends ChangeNotifier {
  List<Todo> todoList;

  TodoListProvider() {
    todoList = [];
  }

  Future insertTodo(Todo todo) async {
    todoList.add(todo);
    notifyListeners();
  }
}