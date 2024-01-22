import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ipc extends StatefulWidget {
  const ipc({Key? key}) : super(key: key);

  @override
  State<ipc> createState() => _ipcState();
}

class _ipcState extends State<ipc> {
  List<String> items = List<String>.generate(511, (i) => 'IPC $i');

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://devgan.in/all_sections_ipc.php'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          items = data.map((item) => item['name'].toString()).toList();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('error fetching data:$error');
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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Stack(
                    children:[ InkWell(onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => result()),
                            );},)
                      ,Container(
                      height: 50,
                      width: 70,
                      color: Color.fromARGB(255, 2, 126, 105),
                      
                      child: ListTile(
                        key:ValueKey<String>(items[index]),
                        tileColor: Color.fromARGB(137, 69, 228, 240),
                        title: Text(items[index + 1]),
                        leading:  Icon(Icons.book_online_rounded),
                        
                      ),
                    ),]
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class result extends StatefulWidget {
  const result({super.key});

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}