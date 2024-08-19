import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;

  const DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF50586C),
      content: SizedBox(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextField
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new task",
                  hintStyle: TextStyle(color: Color(0xFFDCE2F0)),
                ),
                style: const TextStyle(color: Color(0xFFDCE2F0)),
              ),
            ),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cancel button
                MyButton(
                  text: "Cancel",
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
                // Save button
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
