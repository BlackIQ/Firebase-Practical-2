import 'package:firebaseauth/app/services/auth.dart';
import 'package:firebaseauth/app/widgets/buttons/small_button.dart';
import 'package:firebaseauth/app/widgets/buttons/text_button.dart';
import 'package:firebaseauth/app/widgets/fields/field.dart';
import 'package:flutter/material.dart';

class EmailAuth extends StatefulWidget {
  @override
  _EmailAuthState createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  final AuthenticationService _auth = AuthenticationService();
  bool login = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController _register_name = TextEditingController();
    TextEditingController _register_email = TextEditingController();
    TextEditingController _register_password = TextEditingController();

    TextEditingController _login_email = TextEditingController();
    TextEditingController _login_password = TextEditingController();

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
      body: login
          ? SingleChildScrollView(
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
                            onTap: () async {
                              dynamic result = await _auth.registerEmail(
                                  _register_email.text,
                                  _register_password.text);
                              if (result.runtimeType == List) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Something went wrong'),
                                      content: SingleChildScrollView(
                                        child: Text(
                                          result[1],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                            text: 'Login',
                          ),
                          FormTextButton(
                            onTap: () {
                              setState(() {
                                login = false;
                              });
                            },
                            text: 'Register',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
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
                            onTap: () async {
                              dynamic result = await _auth.registerEmail(
                                  _register_email.text,
                                  _register_password.text);
                              if (result.runtimeType == List) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Something went wrong'),
                                      content: SingleChildScrollView(
                                        child: Text(
                                          result[1],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                            text: 'Register',
                          ),
                          FormTextButton(
                            onTap: () {
                              setState(() {
                                login = true;
                              });
                            },
                            text: 'Login',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
