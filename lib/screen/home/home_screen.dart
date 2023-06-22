import 'package:flutter/material.dart';

import 'widgets/custom_note_appbar.dart';
import 'widgets/cutom_note_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomNoteApp(),
      body: CustomNotesBody()
    );
  }
}