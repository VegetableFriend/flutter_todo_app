import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';

/// 添加待办
class AddTodoBottomSheet extends StatefulWidget {
  final Function(Todo todoItem) completeEvent;

  AddTodoBottomSheet({
    @required this.completeEvent
  });

  @override
  _AddTodoBottomSheetState createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {

  TextEditingController _editingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildInputTextField(),
          _buildCompleteButton()
        ],
      ),
    );
  }

  Widget _buildInputTextField() {
    _editingController = TextEditingController();
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextField(
        decoration: InputDecoration(hintText: '请输入内容'),
        controller: _editingController,
      ),
    );
  }

  Widget _buildCompleteButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: MaterialButton(
        child: Text('完成'),
        onPressed: _handleCompleteEvent,
      ),
    );
  }

  _handleCompleteEvent() {
    if (_editingController.text.length == 0) {
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text('待办事项不得为空'),
        );
      });
    } else {
      if (widget.completeEvent != null) {
        widget.completeEvent(Todo(content: _editingController.text));
      }
    }
  }
}
