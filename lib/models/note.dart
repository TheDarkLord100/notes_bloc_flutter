import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_bloc/logic/cubit/app_cubit.dart';

import '../presentaion/screens/home.dart';
import '../presentaion/screens/notes/edit_notes.dart';
import '../presentaion/screens/notes/view_notes.dart';

class Notes extends StatelessWidget {
  const Notes({super.key, this.note, this.docID});

  final QueryDocumentSnapshot? note;
  final String? docID;

  @override
  Widget build(BuildContext context) {
    showConfirmDialog(context) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Delete'),
              content:
                  const Text('Are You Sure You Want To Delete This Note ?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () async {
                      BlocProvider.of<AppCubit>(context).deleteNote(docID!);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const Home();
                      }));
                    },
                    child: const Text('Delete',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold))),
              ],
            );
          });
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Viewnote(
                note: note!,
                docId: docID!,
              );
            }));
          },
          child: Card(
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          // An action can be bigger than the others.
                          flex: 1,
                          onPressed: (context) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return EditNotes(docId: docID!, note: note!);
                            }));
                          },
                          backgroundColor: const Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                        ),
                        SlidableAction(
                          flex: 1,
                          onPressed: (context) {
                            showConfirmDialog(context);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ListTile(
                      isThreeLine: true,
                      title: Text('${note!['title']}'),
                      subtitle: Text(
                        '${note!['note']}',
                        style: const TextStyle(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
