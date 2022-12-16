import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/logic/cubit/app_cubit.dart';

import '../../models/note.dart';
import 'notes/add_note.dart';
import 'sign_in.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference notesref = FirebaseFirestore.instance.collection('notes');

  FirebaseAuth userref = FirebaseAuth.instance;
  String? id;
  @override
  void initState() {
    id = userref.currentUser?.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF3B3B3B),
            ),
            child: IconButton(
                onPressed: () async {
                  await BlocProvider.of<AppCubit>(context).signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return SignIn();
                  }));
                },
                icon: const Icon(Icons.exit_to_app_outlined)),
          ),
          const SizedBox(width: 10)
        ],
        backgroundColor: const Color(0xFF252525),
        title: const Text('Notes'),
        toolbarHeight: 60,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const AddNotes();
          }));
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: userref.userChanges(),
        builder: ((context, snapshot) {
          if (snapshot.data == null) {
            debugPrint("dad");
            return const Center(child: CircularProgressIndicator());
          } else {
            return FutureBuilder<QuerySnapshot>(
              future: notesref
                  .where('User Id', isEqualTo: userref.currentUser?.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if(snapshot.data?.docs.length == 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [Image(
                        image: AssetImage('assets/no_note.png'),
                      ),
                        SizedBox(height: 20,),
                        Text('No Notes found!!', style: TextStyle(color: Colors.grey, fontSize: 18),)
                      ]
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, i) {
                      return Notes(
                        note: snapshot.data?.docs[i],
                        docID: snapshot.data?.docs[i].id,
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          }
        }),
      ),
    );
  }
}
