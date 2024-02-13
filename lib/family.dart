import 'package:PRATISHTHA/logins.dart';
import 'package:flutter/material.dart';

class family extends StatefulWidget {
  const family({super.key});

  @override
  State<family> createState() => _familyState();
}

class _familyState extends State<family> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Signup(),
    );
  }
}