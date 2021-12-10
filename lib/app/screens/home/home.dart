import 'package:firebaseauth/app/widgets/buttons/text_button.dart';
import 'package:firebaseauth/app/widgets/fields/field.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
