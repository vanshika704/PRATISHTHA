import 'package:flutter/material.dart';

class ipc extends StatefulWidget {
  const ipc({Key? key}) : super(key: key);

  @override
  State<ipc> createState() => _ipcState();
}

class _ipcState extends State<ipc> {

  final List<String> items = List<String>.generate(511, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                 
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
