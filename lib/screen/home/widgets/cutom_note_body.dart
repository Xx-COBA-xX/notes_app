// ignore_for_file: camel_case_types, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do_app/data/model/notes/notes_model.dart';

import '../../../cubits/notes_cubit/notes_cubit.dart';
import 'build_note_item.dart';

class CustomNotesBody extends StatefulWidget {
  const CustomNotesBody({super.key});

  @override
  State<CustomNotesBody> createState() => _CustomNotesBodyState();
}

class _CustomNotesBodyState extends State<CustomNotesBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;

        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return BuildNoteItem(
                note: notes[index],
              );
            },
            separatorBuilder: (_, index) {
              return const SizedBox(
                height: 6,
              );
            },
            itemCount: notes.length,
          ),
        );
      },
    );
  }
}
