import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_to_do_app/bloc_observises.dart';
import 'package:my_to_do_app/constant/color.dart';
import 'package:my_to_do_app/cubits/add%20note%20cubit/add_note_cubit.dart';
import 'package:my_to_do_app/data/model/notes/notes_model.dart';

import 'constant/constant.dart';
import 'screen/splash_screen/spash_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Bloc.observer = SampelBlocObservers();
  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: "Poppins",
        textTheme: const TextTheme(
            titleLarge: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: Colors.black,
          overflow: TextOverflow.ellipsis,
          height: 1.3,
        )),
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
