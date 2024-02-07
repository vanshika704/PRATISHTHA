import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final user = FirebaseAuth.instance.currentUser;
  File? _image;
  final picker = ImagePicker();
  Future getimage() async {
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedfile != null) {
        _image = File(pickedfile.path);
      } else {
        Get.snackbar("unable to choose ", "please select a file");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Email: ${user?.email}",
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 130, 241, 236),
          actions: [
            CircleAvatar( maxRadius: 15,
              backgroundColor: Colors.transparent,
              child: _image!=null ? Image.file(_image!.absolute):Center(child:Text(
                user?.email ?? "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 6,
                ),
              ),)
              ),
          ],
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      getimage();
                    },
                    child: Container(
                      height: 80,
                      width: 500,
                      color: Color.fromARGB(255, 130, 240, 248),
                      child: ListTile(
                        tileColor: Color.fromARGB(136, 159, 241, 247),
                        title: Text("Add profile picture"),
                        leading: Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
