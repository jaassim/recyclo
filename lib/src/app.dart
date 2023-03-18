// @dart=2.9
import 'package:flutter/material.dart';
import 'package:recyclo/screens/loginpage.dart';

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recyclo',
      theme: ThemeData(
        accentColor: Colors.grey,
        primarySwatch: Colors.grey,
      ),
      home: LoginScreen(),
    );
  }
}
