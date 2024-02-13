import 'package:flutter/material.dart';

import 'logins.dart';

class tax extends StatefulWidget {
  const tax({super.key});

  @override
  State<tax> createState() => _taxState();
}

class _taxState extends State<tax> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Signup(),
    );
  }
}