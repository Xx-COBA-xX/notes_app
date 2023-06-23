import 'package:flutter/material.dart';

class CustomNoteApp extends StatelessWidget implements PreferredSizeWidget {
  const CustomNoteApp({super.key, required this.icon, required this.title , this.isEdit = false});
  final String title;
  final IconData icon;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 24, color: Colors.white),
          ),
          const Spacer(),
          _buildIcon(icon:icon),
          const SizedBox(
            width: 10,
          ),
          isEdit?const SizedBox():_buildIcon(icon:Icons.person)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85);

  Widget _buildIcon({required icon, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
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
