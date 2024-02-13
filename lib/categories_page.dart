import 'package:PRATISHTHA/individual_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

List<List<dynamic>> items = [
  ["Criminal", AssetImage("assets/criminal.png")],
  ["Family", AssetImage("assets/family.png")],
  ["Civil", AssetImage("assets/civil.webp")],
  ["Tax", AssetImage("assets/tax.png")],
  ["Corporate", AssetImage("assets/corporate.png")],
  ["Licenses", AssetImage("assets/licenses.png")],
  ["Cyber", AssetImage("assets/cyber.png")],
  ["Contract", AssetImage("assets/contract.png")],
  ["Immigration", AssetImage("assets/immigration.png")],
  ["Labour", AssetImage("assets/labour.png")]

];

class CategoriesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Categories",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),), titleTextStyle: GoogleFonts.lexend(color: Color.fromARGB(255, 131, 236, 250), fontSize: 20), backgroundColor: Color.fromARGB(255, 124, 252, 245),),
      body: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: BoxConstraints.loose(Size(330, double.infinity)),
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: ListView.builder(itemBuilder: (context, index) {
              return ListTile(visualDensity: VisualDensity(vertical: 3), leading: AspectRatio(aspectRatio: 1, child: Image(image: items[index][1], width: 6,),), title: Text(items[index][0]), trailing: Icon(Icons.navigate_next_outlined), 
              onTap: () {
                Get.to(IndividualCategory(items[index][0]));
              },);
            }, itemCount: items.length,),
          ),
        ),
      ),
    );
  }
}