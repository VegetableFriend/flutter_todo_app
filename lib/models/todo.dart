import 'package:flutter/cupertino.dart';

/// 待办事项
class Todo {
  /// id
  int id;

  /// 待办内容
  String content;

  /// 是否完成
  bool complete;

  Todo({
    @required this.content
  });

  /// 自定义表名
  static final String tableName = 'todo';

  /// 自定义属性映射表
  static final Map<String, Type> customPropertiesMap = {
    'id': int,
    'content': String,
    'complete': bool
  };
}