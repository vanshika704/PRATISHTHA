import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ipc extends StatefulWidget {
  const ipc({Key? key}) : super(key: key);

  @override
  State<ipc> createState() => _ipcState();
}

class _ipcState extends State<ipc> {
  List<String> items = List<String>.generate(511, (i) => 'IPC $i');

  Future<void> _launchURL() async {
    const url = 'https://devgan.in/all_sections_ipc.php';

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
                          _launchURL();
                        },
                        child: Container(
                          height: 80,
                          width: 500,
                          color: Color.fromARGB(255, 127, 236, 250),
                          child: ListTile(
                            key: ValueKey<String>('${items[index]}_$index'),
                            tileColor: Color.fromARGB(136, 130, 240, 248),
                            title: Text(items[index+1]),
                            leading: Icon(Icons.book,color: Colors.black,),
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
