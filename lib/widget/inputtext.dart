import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String hint;

  const InputText({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
