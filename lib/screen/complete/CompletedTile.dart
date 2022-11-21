
import 'package:flutter/material.dart';

class CompletedTile extends StatelessWidget {
  final String? title;
  final String? detail;
  final bool isChecked;
  final Function checkboxCallback;

  CompletedTile({required this.isChecked, required this.checkboxCallback, this.title, this.detail});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: Colors.brown[300],
        value: isChecked,
        onChanged: (newValue)  {
          checkboxCallback(newValue);
        },
      ),
      title: Text(
        detail!,
        style: TextStyle(
          color: Colors.brown[400],
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        title!,
        style: TextStyle(
          color: Colors.brown[300],
        ),
      ),
    );
  }
}
