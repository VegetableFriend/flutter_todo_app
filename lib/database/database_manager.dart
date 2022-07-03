import 'package:flutter_todo_app/database/sql_helper.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:sqflite/sqflite.dart';

/// DatabaseManager
/// Manage database life cycle and operate database
class DatabaseManager {
  // instance variable
  Future<Database> _database;

  // lazy load shared instance
  static final DatabaseManager _sharedInstance = DatabaseManager._internal();

  factory DatabaseManager.sharedInstance() => _sharedInstance;

  DatabaseManager._internal() {
    _database = openDatabase(SQLHelper.todoListDBName, onCreate: createTable(), version: 2);
  }

  OnDatabaseCreateFn createTable() {
    return (Database db, int version) async {
      await db.execute(SQLHelper.createTableStatementWith(Todo));
    };
  }

  // getter
  Future<Database> database() async {
    return await _database;
  }

  // db operations

}