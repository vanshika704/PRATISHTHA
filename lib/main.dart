import 'package:PRATISHTHA/IPC.dart';
import 'package:PRATISHTHA/MyHomePage.dart';
import 'package:PRATISHTHA/SOS.dart';
import 'package:PRATISHTHA/crpc.dart';
import 'package:PRATISHTHA/lawyer.dart';
import 'package:PRATISHTHA/notes.dart';
import 'package:PRATISHTHA/profiles.dart';
import 'package:PRATISHTHA/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';
import './splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PRATISHTHA',
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? "/splash" : "/home",
      getPages: [
        GetPage(name: "/splash", page: () => SplashPage()),
        GetPage(name: "/lawyer", page: () => Lawyer()),
        GetPage(name: "/profiles", page: () => ListLawyerPage()),
        GetPage(name: "/signup", page: () => Signup()),
        GetPage(name: "/home", page: () => MyHomePage()),
        GetPage(name: "/Indian Penal Code", page: () => ipc()),
        GetPage(name: "/SOS", page: () => SOSbutton()),
        GetPage(name: "/crpc", page: () => crpc()),
        GetPage(name: "/notes", page: () => AddNoteScreen()),
        GetPage(name: "/IPC", page: () => ipc()),
      GetPage(name: "/listlawyers", page: () => ListLawyerPage()),
      ],
    );
  }
}
