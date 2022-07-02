import 'package:flutter/material.dart';
import 'package:flutter_todo_app/database/database_manager.dart';
import 'package:flutter_todo_app/pages/todo_list_provider.dart';
import 'package:provider/provider.dart';
import 'pages/todo_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseManager.sharedInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _homePage(),
    );
  }

  Widget _homePage() {
    return ChangeNotifierProvider(
        create: (_) => TodoListProvider(),
        child: MainPage()
    );
  }
}
