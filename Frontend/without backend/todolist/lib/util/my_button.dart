import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPress;

  MyButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
