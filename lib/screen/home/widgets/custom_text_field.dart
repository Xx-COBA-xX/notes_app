import 'package:flutter/material.dart';

class BuildCustomTextField extends StatelessWidget {
   BuildCustomTextField({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        hintText: title,
        hintStyle: TextStyle(
          color: Colors.white
        )
      ),
    );
  }
}
