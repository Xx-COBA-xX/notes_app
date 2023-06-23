import 'package:flutter/material.dart';
import 'package:my_to_do_app/screen/home/widgets/custom_note_appbar.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomNoteApp(
        icon: Icons.check,
        title: "Edit",
        isEdit: true,
      ),
    );
  }
}
