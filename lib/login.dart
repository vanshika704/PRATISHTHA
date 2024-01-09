import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'MyHomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      print("Signed in with email/password: ${userCredential.user?.uid}");

      Get.snackbar(
        "Success",
        "Signed in successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
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

  void _handleGoogleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        print("Signed in with Google: ${userCredential.user?.uid}");

        Get.snackbar(
          "Success",
          "Signed in with Google successfully",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );

        Get.off(MyHomePage());
      }
    } catch (error) {
      print('Error signing in with Google: $error');
      Get.snackbar(
        "Error",
        "Failed to sign in with Google",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
        backgroundColor: Color.fromARGB(255, 3, 122, 102),
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/emblem.jpg',
              fit: BoxFit.fill,
              height: 400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16),
                ElevatedButton( style: ButtonStyle(backgroundColor:  MaterialStateProperty.all<Color>(
      Color.fromARGB(255, 3, 122, 102),)
    ),
                  onPressed: _signInWithEmailAndPassword,
                  child: Text('Login with Email/Password'),
                ),
                SizedBox(height: 16),
                GoogleSignInButton(onPressed: _handleGoogleSignIn),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  GoogleSignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( style: ButtonStyle(backgroundColor:  MaterialStateProperty.all<Color>(
      Color.fromARGB(255, 3, 122, 102),)
    ),
      onPressed: onPressed,
      child: Text('Sign in with Google'),
    );
  }
}
