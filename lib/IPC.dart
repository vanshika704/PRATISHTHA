import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ipc extends StatefulWidget {
  const ipc({Key? key}) : super(key: key);

  @override
  State<ipc> createState() => _ipcState();
}//.

class _ipcState extends State<ipc> {
  List<String> items = List<String>.generate(511, (i) => 'IPC $i');

  Future<void> _launchURL(int ipcNumber) async {
    final url = 'https://devgan.in/ipc/section/$ipcNumber/';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
                    children: [
                      InkWell(
                        onTap: () {
                          _launchURL(index + 1);
                        },
                        child: Container( 
                          height: 80,
                          width: 500,
                          color: Color.fromARGB(255, 130, 240, 248),
                          child: ListTile(
                            
                            tileColor: Color.fromARGB(136, 159, 241, 247),
                            title: Text(items[index+1]),
                            leading: Icon(Icons.book),
                          ),
                        ),
                      ),
                    ],
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
