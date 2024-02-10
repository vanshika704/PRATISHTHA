import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class IndividualCategory extends StatefulWidget {
  final String category;//.

  const IndividualCategory(this.category);

  @override
  _IndividualCategoryState createState() => _IndividualCategoryState();
}

class _IndividualCategoryState extends State<IndividualCategory> {
  final Stream<QuerySnapshot> lawyerStream =
      FirebaseFirestore.instance.collection('lawyer').snapshots();

  CollectionReference lawyer = FirebaseFirestore.instance.collection('lawyer');

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

        final List<Map<String, dynamic>> storedocs = snapshot.data!.docs
            .map((DocumentSnapshot document) =>
                document.data() as Map<String, dynamic>)
            .toList();

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(widget.category),
            titleTextStyle: GoogleFonts.lexend(
                color: Color.fromARGB(255, 4, 19, 33), fontSize: 20),
            backgroundColor: Color.fromARGB(255, 48, 115, 173),
          ),
          body: GridView.builder(padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
               mainAxisSpacing: 10, 
               crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return SizedBox(height: 40,
                child: Stack(
                  children: [
                    Image.asset("assets/user.webp"),
                    Text(
                      storedocs[index]['name'].toString(),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 254, 254),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: storedocs.length,
          ),
        );
      },
    );
  }
}
