import 'dart:math';

import 'package:PRATISHTHA/individual_person_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_name_generator/random_name_generator.dart';


class IndividualPerson extends StatelessWidget {
  final String name;
  final ImageProvider image;
  final bool verified;
  const IndividualPerson(this.name, this.image, this.verified);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Get.to(IndividualPersonPage(name, image, verified)),
        child: Stack(
          children: [
            Image(image: image),
            Positioned(bottom: 5, left: 5, child: Text(name),),
            Positioned(top: 5, right: 5, child: verified ? Icon(Icons.verified) : Container(),)
          ],
        ),
      ),
    );
  }
}
class IndividualCategory extends StatelessWidget {
  final String category;
  const IndividualCategory(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(category), titleTextStyle: GoogleFonts.lexend(color: Color.fromARGB(255, 4, 19, 33), fontSize: 20), backgroundColor: Color.fromARGB(255, 48, 115, 173),),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200), itemBuilder: (context, index) {
        return IndividualPerson(RandomNames(Zone.india).fullName(), AssetImage("assets/user.webp"), Random.secure().nextBool());
      }),
    );
  }
}