import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:heat_map/fetch_data.dart';

import 'bin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stack(
          children: [
            CustomPaint(
              size: Size(700.0, 700.0),
              painter: MyCustomPainter(),
            ),
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  MyCustomPainter() {
    generateData();
    // Bin.printMatrix(listData);
  }
  double maxWidth = 700.0;
  double maxHeight = 700.0;
  int gridRow = 500;
  int gridColumn = 500;
  double binWidth;
  double binHeight;
  List<List<Bin>> listData = [];

  void generateData() {
    binWidth = maxWidth / gridColumn;
    binHeight = maxHeight / gridRow;

    for (int i = 0; i < gridRow; i++) {
      List<Bin> newRow = [];
      for (int j = 0; j < gridColumn; j++) {
        newRow.add(Bin(binWidth * j, binHeight * i, 0, binWidth, binHeight));
      }
      listData.add(newRow);
    }
    List<RadarData> radarList = FakeData.getListData();
    for (RadarData radar in radarList) {
      for (List<Bin> row in listData) {
        for (Bin bin in row) {
          double distance = bin.getDistanceToPoint(radar.coordinate.x, radar.coordinate.y);
          if (distance <= radar.aveCrowdLevel) {
            bin.colorLevel += 1;
          }
        }
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Size binSize = Size(binWidth, binHeight);
    for (int i = 0; i < listData.length; i++) {
      for (int j = 0; j < listData[i].length; j++) {
        canvas.drawRect(Offset(listData[i][j].x, listData[i][j].y) & binSize,
            Paint()..color = colors[listData[i][j].colorLevel].withOpacity(0.5));
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

final List<Color> colors = [
  Color(0xFF5985E1),
  Color(0xFF5985E1),
  Color(0xFF74FBFD),
  Color(0xFF75FC4C),
  Color(0xFFFEFF54),
  Color(0xFFF19E38),
  Color(0xFFEA3323),
  Color(0xFF8B1A10),
  Color(0xFF8B1A10),
  Color(0xFF8B1A10),
];
