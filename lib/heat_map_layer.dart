import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'bin.dart';
import 'radar_single.dart';

class HeatMapLayer extends StatelessWidget {
  const HeatMapLayer({
    @required this.hpWidth,
    @required this.hpHeight,
    @required this.gridRow,
    @required this.gridColumn,
    @required this.radars,
  });
  final double hpHeight;
  final double hpWidth;
  final int gridRow;
  final int gridColumn;
  final List<RadarSingle> radars;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ClipRect(
        child: Stack(
          children: [
            CustomPaint(
              painter: MyCustomPainter(
                hpWidth: hpWidth,
                hpHeight: hpHeight,
                gridRow: gridRow,
                gridColumn: gridColumn,
                radars: radars,
              ),
            ),
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
              child: Container(
                width: hpWidth,
                height: hpHeight,
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
  MyCustomPainter({
    @required this.hpWidth,
    @required this.hpHeight,
    @required this.gridRow,
    @required this.gridColumn,
    @required this.radars,
  }) {
    generateMatrix();
  }
  final double hpWidth;
  final double hpHeight;
  final int gridRow;
  final int gridColumn;
  final List<RadarSingle> radars;
  final List<List<Bin>> matrix = [];

  double binWidth;
  double binHeight;

  void generateMatrix() {
    binWidth = hpWidth / gridColumn;
    binHeight = hpHeight / gridRow;

    for (int i = 0; i < gridRow; i++) {
      final List<Bin> newRow = [];
      for (int j = 0; j < gridColumn; j++) {
        newRow.add(Bin(binWidth * j, binHeight * i, 0, binWidth, binHeight));
      }
      matrix.add(newRow);
    }
    for (RadarSingle radar in radars) {
      for (List<Bin> row in matrix) {
        for (Bin bin in row) {
          final double distance = bin.getDistanceToPoint(radar.coordinate.x, radar.coordinate.y);
          if (distance <= radar.aveCrowdLevel) {
            bin.colorLevel += 1;
          }
        }
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Size binSize = Size(binWidth, binHeight);
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        canvas.drawRect(Offset(matrix[i][j].x, matrix[i][j].y) & binSize,
            Paint()..color = heatMapColors[matrix[i][j].colorLevel]);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

final List<Color> heatMapColors = [
  const Color(0xFF5985E1),
  const Color(0xFF5985E1),
  const Color(0xFF74FBFD),
  const Color(0xFF75FC4C),
  const Color(0xFFFEFF54),
  const Color(0xFFF19E38),
  const Color(0xFFEA3323),
  const Color(0xFF8B1A10),
  const Color(0xFF8B1A10),
  const Color(0xFF8B1A10),
];