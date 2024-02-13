import 'package:PRATISHTHA/logins.dart';
import 'package:flutter/material.dart';



class criminal extends StatefulWidget {
  const criminal({super.key});

  @override
  State<criminal> createState() => _criminalState();
}

class _criminalState extends State<criminal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Signup(),
    );
  }
}