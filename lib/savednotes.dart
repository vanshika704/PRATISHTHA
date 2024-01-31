import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  final ref = FirebaseDatabase.instance.reference().child('notes');

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
      body: Stack(
        children: [
         
          Image.asset(
            "assets/pexels-pixabay-235985.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

         
          FirebaseAnimatedList(
            query: ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              print('Snapshot Value: ${snapshot.value}');

              if (snapshot.value != null) {
                final title =
                    snapshot.child('title').value?.toString() ?? 'No Title';
                final content =
                    snapshot.child('Content').value?.toString() ?? 'No Content';

                print('Title: $title, Content: $content');

                return ListTile(
                  title: Text(title),
                  subtitle: Text(content),
                );
              } else {
                return Container(child: Text("empty"));
              }
            },
          ),
        ],
      ),
    );
  }
}
