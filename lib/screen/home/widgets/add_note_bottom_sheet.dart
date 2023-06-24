import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do_app/cubits/add%20note%20cubit/add_note_cubit.dart';
import 'package:my_to_do_app/data/model/notes/notes_model.dart';

import '../../../widgets/custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFaliuer) {
            print("Fieled is ${state.errMasage}");
          }
          if (state is AddNoteLoadded) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 20,
                  right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[800],
              ),
              child: const SingleChildScrollView(child: BuildForm()),
            ),
          );
        },
      ),
    );
  }
}

class BuildForm extends StatefulWidget {
  const BuildForm({super.key});

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _key = GlobalKey();
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          BuildTextFormField(
            hint: "Title",
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BuildTextFormField(
            hint: "subtitle",
            maxLines: 4,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 100,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return BuildCustomButton(
                isLoading: state is AddNoteLoadded ? true : false,
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    NoteModel note = NoteModel(
                        color: Colors.cyanAccent.value,
                        date: DateTime.now().toString(),
                        title: title!,
                        subTitle: subtitle!);
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                title: "Add",
              );
            },
          )
        ],
      ),
    );
  }
}
