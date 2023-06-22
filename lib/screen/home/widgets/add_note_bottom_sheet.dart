import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        color: Colors.grey[800],
      ),
      child:  Padding(
        padding: const EdgeInsets.all(16),
        child:  Column(
          children: [
            BuildCustomTextField(title: "Title",)
          ],
        ),
      ),
    );
  }

  
}