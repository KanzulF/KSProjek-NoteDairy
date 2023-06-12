import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projek/models/note.dart';
import 'package:projek/screen/addNotePage.dart';
import 'package:projek/screen/signuppage.dart';
import 'package:projek/widget/inputtext.dart';
import 'package:projek/models/note.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  Widget buildNote(Note note) => ListTile(
        title: Text(note.title),
        subtitle: Text(note.isi.length > 20
            ? '${note.isi.substring(0, 20)}...'
            : note.isi),
      );

  @override
  Widget build(BuildContext context) {
    Stream<List<Note>> readNotes() => FirebaseFirestore.instance
        .collection('noteData')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Note.fromJson(doc.data())).toList());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF308E78),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Dairy Note'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddNotePage()), // Ganti SecondScreen() dengan screen yang ingin dituju
                  );
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(right: 28, left: 28, top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: StreamBuilder<List<Note>>(
                    stream: readNotes(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong! ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final notes = snapshot.data!;
                        return ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            final note = notes[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                title: Text(note.title),
                                subtitle: Text(
                                  note.isi.length > 20
                                      ? '${note.isi.substring(0, 20)}...'
                                      : note.isi,
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
