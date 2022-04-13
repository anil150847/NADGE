import 'package:flutter/material.dart';
import 'package:nudj/ui/widgets/HomeWidget.dart';
import '../ui/widgets/LoginWidget.dart';

void main() async {
  // TODO :
  // 1. Add throbber.
  // 2. Check for standard duration of splash screen.
  await Future.delayed(const Duration(seconds: 1));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: const LoginWidget(title: ''),
     // home: const HomeWidget(title: 'Nudj - Home'),
    );
  }
}
