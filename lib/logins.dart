import 'package:PRATISHTHA/MyHomePage.dart';
import 'package:PRATISHTHA/civil.dart';
import 'package:PRATISHTHA/contract.dart';
import 'package:PRATISHTHA/corporate.dart';
import 'package:PRATISHTHA/criminal.dart';
import 'package:PRATISHTHA/cyber.dart';
import 'package:PRATISHTHA/family.dart';
import 'package:PRATISHTHA/immigration.dart';
import 'package:PRATISHTHA/labour.dart';
import 'package:PRATISHTHA/lawyer.dart';
import 'package:PRATISHTHA/licenses.dart';
import 'package:PRATISHTHA/login.dart';
import 'package:PRATISHTHA/tax.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

List<List<dynamic>> items = [
  ["Criminal", AssetImage("assets/criminal.png")],
  ["Family", AssetImage("assets/family.png")],
  ["Civil", AssetImage("assets/civil.webp")],
  ["Tax", AssetImage("assets/tax.png")],
  ["Corporate", AssetImage("assets/corporate.png")],
  ["Licenses", AssetImage("assets/licenses.png")],
  ["Cyber", AssetImage("assets/cyber.png")],
  ["Contract", AssetImage("assets/contract.png")],
  ["Immigration", AssetImage("assets/immigration.png")],
  ["Labour", AssetImage("assets/labour.png")]
];
List<List<dynamic>> routes = [
  ["Criminal", criminal()],
  ["Family", family()],  
  ["Civil", civil()],   
  ["Tax", tax()],    
  ["Corporate", corporate()],  
  ["Licenses", licenses()],   
  ["Cyber", cyber()],   
  ["Contract", contract()],  
  ["Immigration", immigration()], 
  ["Labour", labour()],      
];
class loginaslawyer extends StatefulWidget {
  const loginaslawyer({super.key});

  @override
  State<loginaslawyer> createState() => _loginaslawyerState();
}

class _loginaslawyerState extends State<loginaslawyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            visualDensity: VisualDensity(vertical: 3),
            leading: AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: items[index][1],
                width: 6,
              ),
            ),
            title: Text(items[index][0]),
            trailing: Icon(Icons.navigate_next_outlined),
            onTap: () {
              Get.to(routes[index][1]);
            },
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _checkUser();

    _displayUserInfo();
  }

  Future<void> _checkUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      Get.off(MyHomePage());
    }
  }

  Future<void> _signUpWithEmailAndPassword() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        "Invalid email format",
        "Email cannot be empty",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
      );

      return;
    }

    if (password.isEmpty || password.length < 6) {
      print("Invalid password. Password must be at least 6 characters long");
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Signed up: ${userCredential.user?.uid}");
      Get.snackbar(
        "Success",
        "Signed up successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
      Get.off(LoginPage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Sign Up Failed',
          'The password provided is too weak. Please choose a stronger password.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Sign Up Failed',
          'An account already exists for the provided email address. Please use a different email.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
      } else {
        print('Unexpected error during sign up: $e');
        Get.snackbar(
          'Sign Up Failed',
          'An unexpected error occurred. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
      }
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
      print('Unexpected error during Google Sign-In: $e');
    }
  }

  void _displayUserInfo() {
    if (user != null) {
      final name = user!.displayName;
      final email = user!.email;

      final emailVerified = user!.emailVerified;
      final uid = user!.uid;

      if (emailVerified) {
        print("User email is verified");
      } else {
        print("User email is not verified");
      }

      print("Name: $name");
      print("Email: $email");

      print("UID: $uid");
    } else {
      print("User is not signed in");
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
                height: 60,
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
                height: 250,
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
                onPressed: _signUpWithEmailAndPassword,
                child: Text(
                  'Sign Up',
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
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 5, 250, 209),
                  ),
                ),
                onPressed: () {
                  Get.to(LoginPage());
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 12, 12, 12),
                      fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 5, 250, 209),
                  ),
                ),
                onPressed: () {
                  Get.to(Lawyer());
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 12, 12, 12),
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


















