import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PRATISHTHA/savednotes.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference().child('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        backgroundColor: Color.fromRGBO(152, 250, 225, 1),
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
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(147, 245, 220, 1),
                ),
              ),
              onPressed: () {
                databaseRef.push().set({
                  'id': DateTime.now().microsecondsSinceEpoch.toString(),
                  'Title': titleController.text.toString(),
                  'Content': contentController.text.toString(),
                }).then((value) {
                  Get.snackbar("post added", titleController.text.toString(),
                      duration: Duration(seconds: 3));
                }).catchError((error, stackTrace) {
                  Get.snackbar("Error", error.toString(),
                      duration: Duration(seconds: 3));
                });
              },
              child: Text(
                'Add Note',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(147, 245, 220, 1),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Saved()),
                );
              },
              child: Text(
                ' Show Saved',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
