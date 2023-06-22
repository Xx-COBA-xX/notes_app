// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'build_note_item.dart';

class CustomNotesBody extends StatelessWidget {
  const CustomNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return const BuildNoteItem();
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 6,
          );
        }, itemCount: 50,
      ),
    );
  }
}

