import 'package:flutter/material.dart';

class TextFormFields extends StatelessWidget {
  TextFormFields({
    this.label,
    this.hint,
    this.controller,
    this.password,
  });

  final label;
  final hint;
  final controller;
  final password;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      obscureText: password,
    );
  }
}
