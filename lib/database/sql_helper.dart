import 'package:flutter_todo_app/models/todo.dart';

/// SQLHelper
/// Generate sql statement and save constants
class SQLHelper {
  static const todoListDBName = "todo_list.db";

  static String createTableStatementWith(Type type) {
    Map<String, Type> customPropertiesMap = {};
    if (type == Todo) {
      customPropertiesMap = Todo.customPropertiesMap;
    }

    return _generateCreateTableStatementWithMap(customPropertiesMap);
  }

  static String _generateCreateTableStatementWithMap(Map<String, Type> customPropertiesMap) {
    String statement = "create table " + Todo.tableName + "(";
    statement = statement + _generateColumnStatementWithMap(customPropertiesMap);
    statement = statement + ")";

    print("${Todo.tableName} create statement: $statement");
    return statement;
  }

  static String _generateColumnStatementWithMap(Map<String, Type> customPropertiesMap) {
    String statement = "";
    int total = customPropertiesMap.keys.length;
    int count = 0;

    customPropertiesMap.forEach((column, type) {
      // property name
      statement = statement + column + " ";
      // property type
      statement = statement + _sqlTypeFromDartType(type);
      // divide if needed
      count += 1;
      if (count < total) {
        statement = statement + ", ";
      }
    });

    return statement;
  }

  static String _sqlTypeFromDartType(Type type) {
    Map<Type, String> sqlTypeMap = {
      int: "int",
      String: "varchar(255)"
    };

    return sqlTypeMap[type];
  }
}