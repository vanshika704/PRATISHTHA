import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  final DatabaseReference _ref = FirebaseDatabase.instance.reference().child('notes');
  final TextEditingController _editController = TextEditingController();

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
              query: _ref,
              defaultChild: Text('Loading'),
              itemBuilder: (context, snapshot, animation, index) {
                return ListTile(
                  title: Text(snapshot.child('Title').value.toString(),style: TextStyle(color: const Color.fromARGB(255, 255, 254, 254),fontWeight: FontWeight.bold),),
                  subtitle: Text(snapshot.child('Content').value.toString(),style: TextStyle(color: const Color.fromARGB(255, 255, 254, 254),fontWeight: FontWeight.bold),),
                  trailing: PopupMenuButton(
                    color: Colors.white,
                    elevation: 4,
                    padding: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    icon: Icon(
                      Icons.more_vert,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            _editController.text = snapshot.child('Title').value.toString();
                            _startEditing(snapshot);
                          },
                          leading: Icon(Icons.edit),
                          title: Text('Edit'),
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            _ref.child(snapshot.key!).remove().then((value) {
                              Get.snackbar(
                                "Note Deleted",
                                "Note successfully deleted!",
                                duration: Duration(seconds: 3),
                              );
                            }).onError((error, stackTrace) {
                              Get.snackbar(
                                "Error",
                                "Failed to delete note: $error",
                                duration: Duration(seconds: 3),
                              );
                            });
                          },
                          leading: Icon(Icons.delete_outline),
                          title: Text('Delete'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _startEditing(DataSnapshot snapshot) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _editController,
                decoration: InputDecoration(labelText: 'Enter update'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _ref.child(snapshot.key!).update({
                    'Content': _editController.text,
                    
                  }).then((value) {
                    Get.snackbar(
                      "Note Updated",
                      "Note successfully updated!",
                      duration: Duration(seconds: 3),
                    );
                    Navigator.pop(context);
                  }).onError((error, stackTrace) {
                    Get.snackbar(
                      "Error",
                      "Failed to update note: $error",
                      duration: Duration(seconds: 3),
                    );
                  });
                },
                child: Text('Update'),
              ),
            ],
          ),
        );
      },
    );
  }
}
