import 'package:flutter/material.dart';

import 'fetch_data.dart';
import 'heat_map_layer.dart';
import 'image_back_ground.dart';
import 'radar_single.dart';

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
      home: Scaffold(
        body: HeatMapWidget(
          realWidth: 880,
          realHeight: 500,
          gridRow: 500,
          gridColumn: 500,
          radars: FakeData.getListData(),
        ),
      ),
    );
  }
}

class HeatMapWidget extends StatelessWidget {
  const HeatMapWidget({
    @required this.realWidth,
    @required this.realHeight,
    @required this.gridRow,
    @required this.gridColumn,
    @required this.radars,
  });
  final double realWidth;
  final double realHeight;
  final int gridRow;
  final int gridColumn;
  final List<RadarSingle> radars;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ImageBackGround(
            imageWidth: realWidth,
            imageHeight: realHeight,
          ),
          Opacity(
            opacity: 0.5,
            child: HeatMapLayer(
              hpWidth: realWidth,
              hpHeight: realHeight,
              gridRow: gridRow,
              gridColumn: gridColumn,
              radars: radars,
            ),
          ),
        ],
      ),
    );
  }
}
