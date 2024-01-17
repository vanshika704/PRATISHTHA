import 'package:PRATISHTHA/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'MyHomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}//.

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
 final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  void initState() {
    super.initState();
  }

 
 Future<void> _signInWithEmailAndPassword() async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    print("Signed in: ${userCredential.user?.uid}");

    Get.snackbar(
      "Success",
      "Signed in successfully",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );

    Get.off(MyHomePage());
  } on FirebaseAuthException catch (e) {
    print("Error: $e");

    Get.snackbar(
      "Error",
      "Failed to sign in: ${e.message}",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }
}



  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      print("Signed in with Google: ${userCredential.user?.displayName}");

      Get.snackbar(
        "Success",
        "Signed in with Google successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
      Get.off(MyHomePage());
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                child: Text(
                  "Welcome to Pratishtha",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 36,
                  ),
                ),
              ),
              Image.asset(
                "assets/emblem.jpg",
                fit: BoxFit.fill,
                height: 270,
                width: 250,
              ),
              SizedBox(height: 16),
              Container(
                width: 250,
                height: 30,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontWeight: FontWeight.w900),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 192, 191, 191),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: 250,
                height: 30,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontWeight: FontWeight.w900),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 192, 191, 191),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 5, 250, 209),
                  ),
                ),
                onPressed: _signInWithEmailAndPassword,
                child: Text(
                  'login',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 7, 7, 7),
                      fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 5, 250, 209),
                  ),
                ),
                onPressed: _signInWithGoogle,
                child: Text(
                  'Sign In with Google',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 12, 12, 12),
                      fontWeight: FontWeight.w900),
                ),
              ),SizedBox(height: 15),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 5, 250, 209),
                  ),
                ),
                onPressed: () {
                  Get.to(Signup());
                },
                child: Text(
                  'Signup',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 12, 12, 12),
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
