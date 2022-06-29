import 'package:flutter_todo_app/database/database_manager.dart';

class TodoListDAO {
  static queryTodoList() {
    DatabaseManager.sharedInstance().database();
  }
}