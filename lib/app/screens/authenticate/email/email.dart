import 'package:firebaseauth/app/services/auth.dart';
import 'package:firebaseauth/app/widgets/buttons/small_button.dart';
import 'package:firebaseauth/app/widgets/buttons/text_button.dart';
import 'package:firebaseauth/app/widgets/fields/field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailAuth extends StatefulWidget {
  @override
  _EmailAuthState createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  final AuthenticationService _auth = AuthenticationService();
  bool login = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController _registerName = TextEditingController();
    TextEditingController _registerEmail = TextEditingController();
    TextEditingController _egisterPassword = TextEditingController();

    TextEditingController _loginEmail = TextEditingController();
    TextEditingController _loginPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Authentication with Email',
          style: GoogleFonts.playfairDisplay(),
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
                        controller: _loginEmail,
                        label: 'Email',
                        hint: 'jon@due.com',
                        password: false,
                      ),
                      SizedBox(height: 10),
                      TextFormFields(
                        controller: _loginPassword,
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
                              dynamic result = await _auth.loginEmail(
                                _loginEmail.text,
                                _loginPassword.text,
                              );
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
                        controller: _registerName,
                        label: 'Name',
                        hint: 'Jon Due',
                        password: false,
                      ),
                      SizedBox(height: 10),
                      TextFormFields(
                        controller: _registerEmail,
                        label: 'Email',
                        hint: 'jon@due.com',
                        password: false,
                      ),
                      SizedBox(height: 10),
                      TextFormFields(
                        controller: _egisterPassword,
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
                                _registerEmail.text,
                                _egisterPassword.text,
                              );
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
