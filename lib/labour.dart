import 'package:flutter/material.dart';

import 'logins.dart';

class labour extends StatefulWidget {
  const labour({super.key});

  @override
  State<labour> createState() => _labourState();
}

class _labourState extends State<labour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Signup(),
    );
  }
}