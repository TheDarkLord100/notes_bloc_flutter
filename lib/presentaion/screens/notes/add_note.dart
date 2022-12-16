import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/widgets.dart';
import '../home.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  AddNotesState createState() => AddNotesState();
}

class AddNotesState extends State<AddNotes> {
  CollectionReference notesref = FirebaseFirestore.instance.collection('notes');
  late String title;
  late String note;

  @override
  Widget build(BuildContext context) {
    addNote() async {
      showLoadingIndicator(context, 'Adding Note');
      await notesref.doc().set({
        'title': title,
        'note': note,
        'User Id': FirebaseAuth.instance.currentUser?.uid
      });
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notes'),
        backgroundColor: const Color(0xFF252525),
        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFF252525),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: Colors.white),

                textAlign: TextAlign.center,
                onChanged: (value) {
                  title = value;
                },
                decoration: mytextFieldDecoration.copyWith(hintText: 'Add Title'),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 120,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    note = value;
                  },
                  decoration: mytextFieldDecoration.copyWith(hintText: 'Add Description'),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              MaterialButtonWidget(
                  color: Colors.deepOrangeAccent,
                  text: 'Add note',
                  function: () {
                    addNote();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
