import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:flutter_todo_app/pages/add_todo_bottom_sheet.dart';
import 'package:flutter_todo_app/pages/todo_list_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// Views
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('待办列表'),
      actions: _buildAppBarButtons(),
    );
  }

  List<Widget> _buildAppBarButtons() {
    return <Widget>[
      IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(context: context, builder: _buildBottomSheet);
          }
      )
    ];
  }

  Widget _buildBody() {
    return _buildListView();
  }

  Widget _buildListView() {
    return Selector<TodoListProvider, int>(
      selector: (context, provider) => provider.todoList.length,
      builder: (context, todoList, child) {
        TodoListProvider provider = Provider.of<TodoListProvider>(context, listen: false);
        return ListView.builder(
            itemCount: provider.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildListTileFromTodoItem(provider.todoList[index]);
            });
      },
    );
  }

  /// 添加待办
  Widget _buildBottomSheet(BuildContext context) {
    return _buildCurrentContextBottomSheet();
  }

  Widget _buildCurrentContextBottomSheet() {
    return AddTodoBottomSheet(completeEvent: (Todo todo) {
      Provider.of<TodoListProvider>(context, listen: false).insertTodo(todo);
    });
  }

  /// 列表展示和事件响应
  ListTile _buildListTileFromTodoItem(Todo todo) {
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.assignment_turned_in_outlined),
        onPressed: () {
          _completeTodoItem(todo);
        },
      ),
      title: Text(todo.content),
      onTap: () {
        _clickTodoItem(todo);
      },
    );
  }

  void _completeTodoItem(Todo todo) {
    TodoListProvider provider = Provider.of<TodoListProvider>(context, listen: false);
    int index = provider.todoList.indexOf(todo);

    print('完成了第 $index 个待办');
  }

  void _clickTodoItem(Todo todo) {
    TodoListProvider provider = Provider.of<TodoListProvider>(context, listen: false);
    int index = provider.todoList.indexOf(todo);

    print('点击了第 $index 个待办');
  }
}
