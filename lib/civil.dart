import 'package:flutter/material.dart';

import 'logins.dart';

class civil extends StatefulWidget {
  const civil({super.key});

  @override
  State<civil> createState() => _civilState();
}

class _civilState extends State<civil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Signup(),
      ) 
    ;
  }
}
