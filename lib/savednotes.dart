import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class saved extends StatefulWidget {
  const saved({super.key});

  @override
  State<saved> createState() => _savedState();
}

class _savedState extends State<saved> {final ref = FirebaseDatabase.instance.ref('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved Notes',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(221, 134, 248, 248),
      ),
      body: FirebaseAnimatedList(
        query: ref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
         return ListTile(
            title: Text(snapshot.child("content").toString()),
           
          );
        },
      ),
    );
  }
}
