import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser;
  File? _image;
  final picker = ImagePicker();
  final firebaseStorage = FirebaseStorage.instance;

  Future<void> getimage() async {
    if (!kIsWeb) {
      try {
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        setState(() {
          if (pickedFile != null) {
            _image = File(pickedFile.path);
          } else {
            Get.snackbar("Unable to choose", "Please select a file");
          }
        });
      } catch (e) {
        print('Error picking image: $e');
        Get.snackbar("Error", "Failed to pick an image. Please try again.");
      }
    } else {
      Get.snackbar("Unsupported", "Image picking is not supported on the web.");
    }
  }

  Future<void> addImage() async {
    if (_image == null) {
      Get.snackbar("Error", "Please select an image first.");
      return;
    }

    try {
      Reference storageReference =
          firebaseStorage.ref().child('profile_images/${user?.uid}.jpg');
      await storageReference.putFile(_image!);
      String downloadURL = await storageReference.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({
        'profileImageUrl': downloadURL,
      });

      Get.snackbar("Success", "Image uploaded successfully!");
    } catch (e) {
      print('Error uploading image: $e');
      Get.snackbar("Error", "Failed to upload an image. Please try again.");
    }
  }

  Future<void> showImage() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Email: ${user?.email}",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 130, 241, 236),
        actions: [
          CircleAvatar(
            maxRadius: 15,
            backgroundColor: Colors.transparent,
            child: _image != null
                ? Image.file(_image!)
                : Center(
                    child: Text(
                      user?.email ?? "",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 6,
                      ),
                    ),
                  ),
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
      ),
    );
  }
}
