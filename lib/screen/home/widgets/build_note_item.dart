import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildNoteItem extends StatelessWidget {
  const BuildNoteItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 12, bottom: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 235, 217, 165)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
              title: const Text(
                "Flutter Tips",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Build Creaitiv app with Haider",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.delete),
              )),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              "May 21, 2023",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
