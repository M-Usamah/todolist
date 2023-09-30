// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:todolist/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content:  Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'Save', onPress: onSave),
                const SizedBox(width: 8),
                MyButton(text: 'Cancel', onPress: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}