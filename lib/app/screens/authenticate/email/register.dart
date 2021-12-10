import 'package:firebaseauth/app/screens/authenticate/email/email.dart';
import 'package:firebaseauth/app/widgets/buttons/small_button.dart';
import 'package:firebaseauth/app/widgets/buttons/text_button.dart';
import 'package:firebaseauth/app/widgets/fields/field.dart';
import 'package:flutter/material.dart';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  @override
  Widget build(BuildContext context) {

    TextEditingController _register_name = TextEditingController();
    TextEditingController _register_email = TextEditingController();
    TextEditingController _register_password = TextEditingController();

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormFields(
                controller: _register_name,
                label: 'Name',
                hint: 'Jon Due',
                password: false,
              ),
              SizedBox(height: 10),
              TextFormFields(
                controller: _register_email,
                label: 'Email',
                hint: 'jon@due.com',
                password: false,
              ),
              SizedBox(height: 10),
              TextFormFields(
                controller: _register_password,
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
                    text: 'Register',
                  ),
                  FormTextButton(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EmailAuth(status: true),
                        ),
                      );
                    },
                    text: 'Login',
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
