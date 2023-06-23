import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[800],
      ),
      child: const SingleChildScrollView(child: BuildForm()),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
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
            BuildCustomButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                title: "Add",)
          ],
        ),
      ),
    );
  }
}
