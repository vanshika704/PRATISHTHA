import 'package:flutter/material.dart';

import 'logins.dart';

class corporate extends StatefulWidget {
  const corporate({super.key});

  @override
  State<corporate> createState() => _corporateState();
}

class _corporateState extends State<corporate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Signup(),
    );
  }
}