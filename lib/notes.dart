import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),backgroundColor: Color.fromARGB(255, 90, 250, 210),
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
              onPressed: () async {
                Note newNote = Note(
                  title: titleController.text,
                  content: contentController.text,
                );

                // Save the note to the database
                NoteDatabase database = NoteDatabase();
                await database.open();
                await database.insertNote(newNote);

                // TODO: Navigate back to the previous screen or update UI as needed
                // Navigator.push(context);
              },
              child: Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}

class Note {
  String? id; // Unique identifier, you can use a package like uuid
  String title;
  String content;

  Note({
    this.id,
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}

class NoteDatabase {
  late Database _database;

  Future<void> open() async {
    if (!_database.isOpen) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'notes_database.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE notes(id TEXT PRIMARY KEY, title TEXT, content TEXT)',
          );
        },
        version: 1,
      );
    }
  }

  Future<void> insertNote(Note note) async {
    await _database.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
