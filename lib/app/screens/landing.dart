import 'package:firebaseauth/app/screens/authenticate/authenticate.dart';
import 'package:firebaseauth/app/screens/home/home.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    dynamic user = null;

    if (user == null) {
      return Authenticate();
    }
    else {
      return Home();
    }
  }
}
