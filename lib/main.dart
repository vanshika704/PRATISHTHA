import 'package:PRATISHTHA/MyHomePage.dart';
import 'package:PRATISHTHA/signup.dart';
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
  runApp(const MyApp(
   
  ));
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      title: 'PRATISHTHA',

     
      home: (FirebaseAuth.instance.currentUser == null) ? SplashPage(): MyHomePage(),
      
      getPages: [GetPage(name: "/signup", page: () => Signup())],
    );
  }
}
