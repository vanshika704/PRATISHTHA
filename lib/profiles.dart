import 'dart:async';
import 'dart:math';

import 'package:PRATISHTHA/individual_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';

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
          print('Something went Wrong');
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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              ),
              itemCount: storedocs.length,
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Center(
                    child: Stack(
                      children:[ IndividualPerson(RandomNames(Zone.india).fullName(),
         AssetImage("assets/user.webp"), Random.secure().nextBool()),Text(
                        storedocs[index]['emailid'] ?? '',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ]),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
