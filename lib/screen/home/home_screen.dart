import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import 'widgets/add_note_bottom_sheet.dart';
import 'widgets/custom_note_appbar.dart';
import 'widgets/cutom_note_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: SafeArea(
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
                    return const AddNoteBottomSheet();
                  });
            },
            backgroundColor: Colors.grey[600],
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
