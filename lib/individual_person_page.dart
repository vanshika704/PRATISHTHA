import 'dart:math';

import 'package:flutter/material.dart';

class IndividualPersonPage extends StatelessWidget {
  final String name;
  final ImageProvider image;
  final bool verified;
  const IndividualPersonPage(this.name, this.image, this.verified);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Column(
        children: [SizedBox.fromSize(size: MediaQuery.sizeOf(context), child: 
        SafeArea(
          child: Stack(children: [
            Align(alignment: Alignment.center, child: Image(image: image, fit: BoxFit.fill,)),
            Positioned(bottom: 14, left:8, child: Text(name, style: TextStyle(fontSize: 20),)),
            Positioned(top: 8, left: 8, child: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context),)),
            Positioned(top: 5, right: 8, child: verified ? Icon(Icons.verified) : Container(),),
            Positioned(right: 14, bottom: 14, child: Icon(Icons.chat),)
          ]),
        )),
        ListTile(
          title: Text("Rating"),
          trailing: Text((Random.secure().nextInt(10)+1).toString()),
        )
        ],
      ),
    ),);
  }
}