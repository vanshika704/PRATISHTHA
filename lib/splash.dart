import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './util.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.deviceSize,
    required this.title,
    required this.onTap,
  });

  final Size deviceSize;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            left: deviceSize.width / 46, right: deviceSize.width / 46),
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
              foregroundColor: Color(0xFF252525),
              textStyle: GoogleFonts.lexend(
                  fontSize: getAdjustedPixelRatio(context) * 5.6),
              minimumSize: Size(20, 40),
              maximumSize: Size(40, 40),
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.4),
                  borderRadius: BorderRadius.circular(5))),
          child: Text(title),
        ),
      ),
    );
  }
}

Widget bottomSheetBuilder(BuildContext context) {
  Size deviceSize = MediaQuery.of(context).size;

  return SizedBox(
    child: Container(
      height: deviceSize.height / 4.5,
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: deviceSize.width / 5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.shade900),
          ),
          SizedBox(height: deviceSize.height / 30),
          Padding(
            padding: EdgeInsets.only(
                top: deviceSize.height / 1000,
                left: deviceSize.width / 22,
                bottom: deviceSize.height / 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "You are?",
                style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w500,
                    fontSize: getAdjustedPixelRatio(context) * 8),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width / 46),
            child: Row(
              children: [
                CustomOutlinedButton(
                  deviceSize: deviceSize,
                  title: "Lawyer",
                  onTap: () {
                    Get.toNamed("/lawyerlogin");
                  },
                ),
                CustomOutlinedButton(
                  deviceSize: deviceSize,
                  title: "Citizen",
                  onTap: () {
                    Get.toNamed("/signup");
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: deviceSize.height / 1200),
        ],
      ),
    ),
  );
}

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.toNamed("/splash");
      } else {
        Get.toNamed("/MyHomePage");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width / 30,
                vertical: deviceSize.height / 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  "PRATISHTHA",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              children: [
                Image.asset(
                  "assets/IMG_20240116_173940.jpg",
                  height: 300,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: deviceSize.width / 30,
              right: deviceSize.width / 30,
              top: deviceSize.height / 100,
            ),
            child: Text.rich(TextSpan(
                style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: getAdjustedPixelRatio(context) * 14.2),
                children: const [
                  TextSpan(
                      text: "Legal assistance in your phone ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 10, 12, 12),
                          fontSize: 25)),
                  TextSpan(
                      text: "!!!\n",
                      style: TextStyle(color: Color(0xff09487e), fontSize: 25)),
                  TextSpan(
                      text: "Lawyers and clients\n",
                      style: TextStyle(
                          color: Color.fromARGB(255, 3, 3, 3), fontSize: 25)),
                  TextSpan(
                      text: "on one platform\n",
                      style: TextStyle(
                          color: Color.fromARGB(255, 8, 8, 8), fontSize: 25))
                ])),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: deviceSize.height / 500,
              left: deviceSize.width / 25,
            ),
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: bottomSheetBuilder,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))));
                },
                child: Container(
                  width: deviceSize.width / 4.5,
                  height: deviceSize.height / 20,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 48, 169, 173),
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Text(
                      "Start",
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 5, 9),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: deviceSize.height / 60,
                  bottom: deviceSize.height / 90,
                ),
                child: Text.rich(TextSpan(
                    style: GoogleFonts.lexend(
                        fontSize: getAdjustedPixelRatio(context) * 5.5),
                    children: const [
                      TextSpan(text: "Developed with "),
                      TextSpan(text: "❤️", style: TextStyle(color: Colors.red)),
                      TextSpan(text: " By "),
                      TextSpan(
                          text: "Ashwathama",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ])),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
