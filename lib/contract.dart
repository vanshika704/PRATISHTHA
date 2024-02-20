import 'package:PRATISHTHA/logins.dart';
import 'package:flutter/material.dart';

class contract extends StatefulWidget {
  const contract({super.key});

  @override
  State<contract> createState() => _contractState();
}

class _contractState extends State<contract> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Signup(),
    );
  }
}
