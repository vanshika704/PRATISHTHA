import 'package:PRATISHTHA/lawyer.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; 

class ListLawyerPage extends StatefulWidget {
  ListLawyerPage({Key? key}) : super(key: key);

  @override
  _ListLawyerPageState createState() => _ListLawyerPageState();
}

class _ListLawyerPageState extends State<ListLawyerPage> {
  final Stream<QuerySnapshot> lawyerStream =
      FirebaseFirestore.instance.collection('lawyer').snapshots();

  CollectionReference lawyers = FirebaseFirestore.instance.collection('lawyer');
  
  Future<void> deleteLawyer(id) {
    print("Lawyer Deleted $id");
    return lawyers
        .doc(id)
        .delete()
        .then((value) => print('Lawyer Deleted'))
        .catchError((error) => print('Failed to Delete lawyer: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: lawyerStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<Map<String, dynamic>> storedocs = [];
        snapshot.data!.docs.forEach((DocumentSnapshot document) {
          Map<String, dynamic> a = document.data() as Map<String, dynamic>;
          a['id'] = document.id;
          storedocs.add(a);
        });

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Table(
              border: TableBorder.all(color: Colors.black),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.greenAccent),
                  children: [
                    buildTableCell('Name'),
                    buildTableCell('Email'),
                    buildTableCell('Action'),
                  ],
                ),
                for (var i = 0; i < storedocs.length; i++) ...[
                  TableRow(
                    children: [
                      buildTableCell(storedocs[i]['name']),
                      buildTableCell(storedocs[i]['email']),
                      buildActionTableCell(storedocs[i]['id']),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }

  Widget buildActionTableCell(String id) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateLawyerPage(id: id),
                ),
              );
            },
            icon: Icon(
              Icons.edit,
              color: Colors.orange,
            ),
          ),
          IconButton(
            onPressed: () => deleteLawyer(id),
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
