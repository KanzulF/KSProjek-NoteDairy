import 'package:flutter/material.dart';
import 'package:projek/models/note.dart';
import 'package:projek/encrypt/encryption.dart';
import 'package:projek/widget/kotak.dart';

class DetailNotePage extends StatefulWidget {
  final Note note;

  const DetailNotePage({super.key, required this.note});

  @override
  _DetailNotePageState createState() => _DetailNotePageState();
}

class _DetailNotePageState extends State<DetailNotePage> {
  String decryptedText = '';

  void decryptText() {
    String plaintext = EncryptionDescryption.decryptAES(widget.note.isi);
    setState(() {
      decryptedText = plaintext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF308E78),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Kotak(text: widget.note.title),
            Kotak(text: widget.note.isi),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: decryptText,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF308E78),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Encrypt',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Kotak(text: decryptedText)
          ],
        ),
      ),
    );
  }
}
