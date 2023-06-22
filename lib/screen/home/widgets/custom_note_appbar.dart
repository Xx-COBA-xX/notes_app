import 'package:flutter/material.dart';

class CustomNoteApp extends StatelessWidget implements PreferredSizeWidget{
  const CustomNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
  @override
  Size get preferredSize =>const Size.fromHeight(50);
}