import 'package:firebaseauth/app/models/user.dart';
import 'package:firebaseauth/app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthenticationService _auth = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ],
        title: Text('Firebase Home'),
      ),
      body: _page(),
    );
  }

  Widget _page() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text('You are logged in now.'),
        ],
      ),
    );
  }
}
