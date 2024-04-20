import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class citizen extends StatefulWidget {
  const citizen({Key? key}) : super(key: key);

  @override
  State<citizen> createState() => _citizenState();
}

class _citizenState extends State<citizen> {
  bool _contactedLawyer = false;
  bool _paidLawyer = false;
  bool _challanReport = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Progress...",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Image.asset("assets/Untitled design.jpg"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Welcome back !!!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: _contactedLawyer,
                      onChanged: (value) {
                        setState(() {
                          _contactedLawyer = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "Did you contact the lawyer regarding the date?",
                        style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: _paidLawyer,
                      onChanged: (value) {
                        setState(() {
                          _paidLawyer = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "Did you pay the lawyer?",
                        style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: _challanReport,
                      onChanged: (value) {
                        setState(() {
                          _challanReport = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "Did you submit the challan report?",
                        style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                   Get.toNamed("/home");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  child: Text(
                    "Start",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
