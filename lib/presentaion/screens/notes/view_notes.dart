import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_bloc/presentaion/screens/notes/edit_notes.dart';

class Viewnote extends StatelessWidget {
  const Viewnote({Key? key, required this.note, required this.docId})
      : super(key: key);
  final QueryDocumentSnapshot note;
  final String docId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return EditNotes(
              docId: docId,
              note: note,
            );
          }));
        },
        child: const Icon(Icons.edit),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF252525),
        title: Text(note['title']),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF252525),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          note['note'],
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
