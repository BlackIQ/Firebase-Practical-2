import 'package:flutter/material.dart';

class FormTextButton extends StatelessWidget {
  FormTextButton({
    this.text,
    this.onTap,
  });

  final text;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
