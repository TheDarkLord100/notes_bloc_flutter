import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/logic/cubit/app_cubit.dart';

import '../../widgets/widgets.dart';
import '../home.dart';

class EditNotes extends StatefulWidget {
  const EditNotes({Key? key, required this.note, required this.docId})
      : super(key: key);
  final QueryDocumentSnapshot note;
  final String docId;

  @override
  EditNotesState createState() => EditNotesState();
}

class EditNotesState extends State<EditNotes> {
  late String title;
  late String note;
  @override
  void initState() {
    title = widget.note['title'];
    note = widget.note['note'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    editNote() async {
      showLoadingIndicator(context, 'Adding Note');
      BlocProvider.of<AppCubit>(context).editANote(
          title: title,
          note: note,
          docID: widget.docId,
          uId:
              BlocProvider.of<AppCubit>(context).firebaseAuth.currentUser!.uid);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        backgroundColor: Color(0xFF252525),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFF252525),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  initialValue: widget.note['title'],
                  onChanged: (value) {
                    title = value;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration:
                      mytextFieldDecoration.copyWith(hintText: 'Note title'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: 120,
                  child: TextFormField(
                    maxLines: 5,
                    textAlign: TextAlign.left,
                    initialValue: widget.note['note'],
                    onChanged: (value) {
                      note = value;
                    },
                    decoration: mytextFieldDecoration.copyWith(hintText: ''),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                MaterialButtonWidget(
                    color: Colors.deepOrangeAccent,
                    text: 'Save',
                    function: () {
                      editNote();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
