import 'package:flutter/material.dart';

class TextFieldObscure extends StatefulWidget {
  const TextFieldObscure({
    super.key,
    required this.isObscure,
  });
  final Function(bool) isObscure;

  @override
  State<TextFieldObscure> createState() => _TextFieldObscureState();
}

class _TextFieldObscureState extends State<TextFieldObscure> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isCheck = !isCheck;
        });
        widget.isObscure(!isCheck);
      },
      borderRadius: BorderRadius.circular(15),
      child: Icon(
        isCheck ? Icons.visibility : Icons.visibility_off,
        color: Colors.white,
      ),
    );
  }
}
