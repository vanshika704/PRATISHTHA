import 'package:PRATISHTHA/SOS.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'IPC.dart';//..

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text(
              "SERVICES....",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            )),
        body:Center( child:
          SingleChildScrollView(
            child: Column(
              children: [
                IPC(),
                SOS()
              ],
            ),
          ),
         
        ));
  }
}
class IPC extends StatefulWidget {
  const IPC({super.key});

  @override
  State<IPC> createState() => _IPCState();
}

class _IPCState extends State<IPC> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,width: 300,
       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 152, 214, 245),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            "Indian Penal Code",
            style: TextStyle(
              color: Color.fromARGB(255, 10, 11, 12),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.read_more,
                color: Color.fromARGB(255, 22, 72, 119),
                size: 25,
              )),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ipc()));
            },
            child: Text("click me"),
          )
        ]));
  }
}
class SOS extends StatefulWidget {
  const SOS({super.key});

  @override
  State<SOS> createState() => _SOSState();
}

class _SOSState extends State<SOS> {
  @override
  Widget build(BuildContext context) {
     return Container(
      height: 60,width: 300,
       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 152, 214, 245),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            "SOS",
            style: TextStyle(
              color: Color.fromARGB(255, 10, 11, 12),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.read_more,
                color: Color.fromARGB(255, 22, 72, 119),
                size: 25,
              )),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SOSbutton()));
            },
            child: Text("click me"),
          )
        ]));
  }
}
 
    
