import 'package:firebaseauth/app/widgets/buttons/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Login to an account',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _page(),
    );
  }

  Widget _page() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Signin',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Choose your way to enter the app',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 50),
            WideButton(
              text: 'Login in with Google',
              icon: FontAwesomeIcons.google,
            ),
            SizedBox(height: 10),
            WideButton(
              text: 'Login in with Facebook',
              icon: FontAwesomeIcons.facebook,
            ),
            SizedBox(height: 10),
            WideButton(
              text: 'Login in with Apple',
              icon: FontAwesomeIcons.apple,
            ),
            SizedBox(height: 10),
            Text(
              'Or',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
            WideButton(
              text: 'Login in Email',
              icon: FontAwesomeIcons.solidEnvelope,
            ),
            SizedBox(height: 5),
            WideButton(
              text: 'Login in Anonymous',
              icon: FontAwesomeIcons.userSecret,
            ),
          ],
        ),
      ),
    );
  }
}
