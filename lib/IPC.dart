import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ipc extends StatefulWidget {
  const ipc({Key? key}) : super(key: key);

  @override
  State<ipc> createState() => _ipcState();
}

class _ipcState extends State<ipc> {

  List<String> items = List<String>.generate(511, (i) => 'Item $i');
  @override
   void initState() {
    super.initState();
   
    fetchData();
  }
  Future<void> fetchData() async {
    
    final response = await http.get(Uri.parse('https://devgan.in/all_sections_ipc.php'));

    if (response.statusCode == 200) {
     
      final List<dynamic> data = json.decode(response.body);

      setState(() {
       
        items = data.map((item) => item['name'].toString()).toList();
      });
    } else {
      
      throw Exception('Failed to load data');
    }
  }
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
