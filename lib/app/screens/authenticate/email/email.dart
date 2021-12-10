import 'package:firebaseauth/app/screens/authenticate/email/login.dart';
import 'package:firebaseauth/app/screens/authenticate/email/register.dart';
import 'package:flutter/material.dart';

class EmailAuth extends StatefulWidget {
  EmailAuth({this.status});

  final status;

  @override
  _EmailAuthState createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  @override
  Widget build(BuildContext context) {
    bool login;

    setState(() {
      login = widget.status;
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Authentication with Email',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: login ? LoginEmail() : RegisterEmail(),
    );
  }
}
