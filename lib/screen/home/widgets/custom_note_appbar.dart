import 'package:flutter/material.dart';

class CustomNoteApp extends StatelessWidget implements PreferredSizeWidget {
  const CustomNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Text(
              "Notes",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 24,color: Colors.white),
                  
            ),
            const Spacer(),
            _buildIcon(Icons.search),
            const SizedBox(width: 10,),
            _buildIcon(Icons.person)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85);

  Widget _buildIcon(IconData icon) {
    return GestureDetector(
      child: Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey),
        child: Icon(
          icon,
          color: Colors.white,
          size: 33,
        ),
      ),
    );
  }
  
}
