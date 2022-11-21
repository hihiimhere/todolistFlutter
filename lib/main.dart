import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_ver2/model/set_task_provider.dart';
import 'screen/home.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SetTaskProvider()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
