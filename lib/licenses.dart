import 'package:PRATISHTHA/logins.dart';
import 'package:flutter/material.dart';

class licenses extends StatefulWidget {
  const licenses({super.key});

  @override
  State<licenses> createState() => _licensesState();
}

class _licensesState extends State<licenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Signup(),
    );
  }
}