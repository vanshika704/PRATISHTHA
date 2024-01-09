import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SOSbutton extends StatefulWidget {
  const SOSbutton({Key? key}) : super(key: key);

  @override
  State<SOSbutton> createState() => _SOSbuttonState();
}

class _SOSbuttonState extends State<SOSbutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SOS (Emergency!!!!!)"),
        backgroundColor: Color.fromARGB(255, 3, 164, 185),
        titleTextStyle: TextStyle(color: Colors.black, height: 10),
      ),
      body:  Column(
        children:[ Image.asset("assets/police.webp",fit: BoxFit.fill,),
          ElevatedButton(
          onPressed: () {
           
            Get.to(() => EmergencyButtonScreen());
          },
          child: Text("HELP!!!!"),
        ),]
      ),
    );
  }
}


class EmergencyButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency Button Screen"),
      ),
      body: Text(" message and location given to the nearest police station")
    );
  }
}
