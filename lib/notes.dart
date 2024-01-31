import 'package:PRATISHTHA/savednotes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        backgroundColor: Color.fromARGB(255, 90, 250, 210),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                databaseRef
                    .child('1')
                    .set({'notes': contentController.text.toString()})
                    .then((value) {})
                    .catchError((error, stackTrace) {
                      Get.snackbar("Error", error.toString(),
                          duration: Duration(seconds: 3));
                    });
              },
              child: Text('add Note'),
            ),
           ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,  
      MaterialPageRoute(builder: (context) => Saved()),
    );
  },
  child: Text('saved'),
),

          ],
        ),
      ),
    );
  }
}
