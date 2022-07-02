import 'package:flutter_todo_app/database/database_manager.dart';
import 'package:flutter_todo_app/models/todo.dart';

class TodoListDAO {
  static queryTodoList() async {
    DatabaseManager.sharedInstance().database();
  }

  static insertItemIntoTodoList(Todo todo) async {

  }
}