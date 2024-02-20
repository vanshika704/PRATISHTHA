import 'package:PRATISHTHA/logins.dart';
import 'package:flutter/material.dart';

class cyber extends StatefulWidget {
  const cyber({super.key});

  @override
  State<cyber> createState() => _cyberState();
}

class _cyberState extends State<cyber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Signup(),
    );
  }
}