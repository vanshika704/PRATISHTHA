import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Dashboard1 extends StatefulWidget {
  const Dashboard1({Key? key}) : super(key: key);

  @override
  State<Dashboard1> createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Much more to go!!!",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 133, 239, 243),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height * 0.5, 
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Progress Report of client 1",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 16.0), 
                  LineChart(
                    LineChartData(
                     
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: const Color(0xff37434d), width: 1),
                      ),
                      minX: 0,
                      maxX: 7,
                      minY: 0,
                      maxY: 6,
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 3),
                            FlSpot(1, 1),
                            FlSpot(2, 4),
                            FlSpot(3, 2),
                            FlSpot(4, 5),
                            FlSpot(5, 3),
                            FlSpot(6, 4),
                          ],
                          isCurved: true,
                          color: Color.fromARGB(255, 7, 42, 87),
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
        
                      ],
                    ),
                  ),
                  Text(
                    "Progress Report of client 2",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 16.0), 
                  LineChart(
                    LineChartData(
                     
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: const Color(0xff37434d), width: 1),
                      ),
                      minX: 0,
                      maxX: 7,
                      minY: 0,
                      maxY: 6,
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 3),
                            FlSpot(1, 1),
                            FlSpot(2, 4),
                            FlSpot(3, 2),
                            FlSpot(4, 5),
                            FlSpot(5, 3),
                            FlSpot(6, 4),
                          ],
                          isCurved: true,
                          color: Color.fromARGB(255, 7, 42, 87),
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
