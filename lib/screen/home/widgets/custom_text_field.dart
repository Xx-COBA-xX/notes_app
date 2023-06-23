import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  const BuildTextFormField(
      {super.key, required this.hint, this.onSaved, this.maxLines = 1});

  final void Function(String?)? onSaved;
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "this field is required";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        border: buildBorder(),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.white54,
        ),
      ),
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white70,
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.white, width: 1),
    );
  }
}
