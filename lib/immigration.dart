import 'package:PRATISHTHA/logins.dart';
import 'package:flutter/material.dart';

class immigration extends StatefulWidget {
  const immigration({super.key});

  @override
  State<immigration> createState() => _immigrationState();
}

class _immigrationState extends State<immigration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Signup(),
    );
  }
}
