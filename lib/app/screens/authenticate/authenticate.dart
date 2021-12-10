import 'package:firebaseauth/app/screens/authenticate/email/email.dart';
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
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Login to an account'),
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
              onTap: () {},
              text: 'Login in with Google',
              icon: FontAwesomeIcons.google,
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
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EmailAuth(status: true),
                  ),
                );
              },
              text: 'Login in Email',
              icon: FontAwesomeIcons.solidEnvelope,
            ),
            SizedBox(height: 5),
            WideButton(
              onTap: () {},
              text: 'Login in Anonymous',
              icon: FontAwesomeIcons.userSecret,
            ),
          ],
        ),
      ),
    );
  }
}
