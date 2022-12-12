import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.content,
  });
  final Function()? onPressed;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          content,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
