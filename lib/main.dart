import 'package:flutter/material.dart';
import 'package:todo_list/views/authentication/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo_list',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Onboardingscreen(),
      debugShowCheckedModeBanner : false
    );
    
  }
}
