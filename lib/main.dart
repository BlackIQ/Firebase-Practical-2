import 'package:firebaseauth/app/screens/landing.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange[800],
        backgroundColor: Colors.white,
      ),
      home: Landing(),
    );
  }
}
