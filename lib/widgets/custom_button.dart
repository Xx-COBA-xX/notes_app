import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant/color.dart';

class BuildCustomButton extends StatelessWidget {
  const BuildCustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.isLoading = false});
  final void Function()? onPressed;
  final String title;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ));
  }
}
