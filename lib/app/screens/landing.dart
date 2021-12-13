import 'package:firebaseauth/app/models/user.dart';
import 'package:firebaseauth/app/screens/authenticate/authenticate.dart';
import 'package:firebaseauth/app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user == null ? Authenticate() : Home();
  }
}
