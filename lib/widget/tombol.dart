import 'package:flutter/material.dart';

class Tombol extends StatelessWidget {
  final String judul;
  final Color color;
  final MaterialPageRoute nextpage;

  const Tombol(
      {super.key,
      required this.judul,
      required this.color,
      required this.nextpage});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          nextpage,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          judul,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
