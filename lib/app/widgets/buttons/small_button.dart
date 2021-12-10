import 'package:flutter/material.dart';

class FormNormalButton extends StatelessWidget {
  FormNormalButton({
    this.text,
    this.onTap,
  });

  final text;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
      ),
    );
  }
}
