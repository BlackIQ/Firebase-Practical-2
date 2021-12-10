import 'package:firebaseauth/app/screens/authenticate/email/email.dart';
import 'package:firebaseauth/app/widgets/buttons/small_button.dart';
import 'package:firebaseauth/app/widgets/buttons/text_button.dart';
import 'package:firebaseauth/app/widgets/fields/field.dart';
import 'package:flutter/material.dart';

class LoginEmail extends StatefulWidget {
  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _login_email = TextEditingController();
    TextEditingController _login_password = TextEditingController();

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormFields(
                controller: _login_email,
                label: 'Email',
                hint: 'jon@due.com',
                password: false,
              ),
              SizedBox(height: 10),
              TextFormFields(
                controller: _login_password,
                label: 'Password',
                hint: '********',
                password: true,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FormNormalButton(
                    onTap: () {},
                    text: 'Login',
                  ),
                  FormTextButton(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EmailAuth(status: false),
                        ),
                      );
                    },
                    text: 'Register',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
