import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  bool isLoading;

  CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Text(text));
  }
}
