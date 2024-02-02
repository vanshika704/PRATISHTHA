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
   TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('notes');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved Notes',
          style: TextStyle(
            color: const Color.fromARGB(255, 253, 252, 252),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 46, 30, 24),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/pexels-pixabay-235985.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SizedBox(height: 20.0),
            Expanded(
              child: FirebaseAnimatedList(
                query: databaseRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  print('Snapshot Value: ${snapshot.value}');

                 if (snapshot.value != null) {
                final title =
                    snapshot.child('Title').value?.toString() ?? 'No title';
                final content =
                    snapshot.child('Content').value?.toString() ?? 'No content';

                    print('title: $title, content: $content');

                    return ListTile(
                      title: Text(
                        title,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 253, 252, 252),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        content,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 250, 249, 249),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return Container(child: Text("empty"));
                  }
                },
              ),
            ),
          
        ],
      ),
    );
  }
}
