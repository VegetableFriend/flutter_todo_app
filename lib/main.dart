import 'package:flutter/material.dart';
import 'package:flutter_todo_app/database/database_manager.dart';
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
      home: MainPage(),
    );
  }
}
