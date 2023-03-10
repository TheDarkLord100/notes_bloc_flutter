import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes_bloc/data/note_repository.dart';
import 'package:notes_bloc/firebase_options.dart';
import 'package:notes_bloc/logic/cubit/app_cubit.dart';
import 'package:notes_bloc/presentaion/screens/notes/add_note.dart';
import 'package:notes_bloc/presentaion/screens/sign_up.dart';
import 'presentaion/screens/home.dart';
import 'presentaion/screens/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool isSignedIn = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(
          repository: NoteRepository(
            firestore: FirebaseFirestore.instance.collection('notes'),
          ),
          firebaseAuth: firebaseAuth),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (context) => const Home(),
          'signin': (context) => SignIn(),
          'signup': (context) => SignUp(),
          'add': (context) => const AddNotes(),
        },
        home: StreamBuilder(
            stream: firebaseAuth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const Home();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }

              if (snapshot.connectionState == ConnectionState.active) {
                return SignIn();
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrangeAccent,
                  ),
                );
              }
            }),
      ),
    );
  }
}
