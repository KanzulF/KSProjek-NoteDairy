import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projek/models/note.dart';
import 'package:projek/widget/inputtext.dart';

import 'package:projek/encrypt/encryption.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final controllerTitle = TextEditingController();
  final controllerIsi = TextEditingController();

  String handleSubmit(String input) {
    String manipulatedInput = EncryptionDescryption.encryptAES(input);
    return manipulatedInput;
  }

  @override
  Widget build(BuildContext context) {
    Future createNote(Note note) async {
      final docNote = FirebaseFirestore.instance.collection('noteData').doc();

      note.id = docNote.id;
      final json = note.toJson();
      await docNote.set(json);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF308E78),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('Add Note'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 64, left: 64, top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 96.0),
              Column(
                children: [
                  InputText(
                    hint: 'Judul',
                    obscure: false,
                    controller: controllerTitle,
                  ),
                  const SizedBox(height: 16.0),
                  InputText(
                    line: 7,
                    hint: "Tuliskan pesanmu...",
                    obscure: false,
                    controller: controllerIsi,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                width: 150.0, // Atur lebar sesuai kebutuhan
                height: 40.0, // Atur tinggi sesuai kebutuhan
                child: ElevatedButton(
                  onPressed: () async {
                    String isiEncrypted = handleSubmit(controllerIsi.text);
                    final note =
                        Note(title: controllerTitle.text, isi: isiEncrypted);
                    createNote(note);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Color(0xFF308E78), // Atur warna latar belakang tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Atur border radius tombol
                    ),
                  ),
                  child: const Text(
                    'Save Note',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
