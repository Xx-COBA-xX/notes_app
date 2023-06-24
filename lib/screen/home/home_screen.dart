import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do_app/cubits/add%20note%20cubit/add_note_cubit.dart';

import 'widgets/add_note_bottom_sheet.dart';
import 'widgets/custom_note_appbar.dart';
import 'widgets/cutom_note_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomNoteApp(icon: Icons.search, title: "Notes"),
        body: const CustomNotesBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => AddNoteCubit(),
                    child: const AddNoteBottomSheet(),
                  );
                });
          },
          backgroundColor: Colors.grey[600],
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
