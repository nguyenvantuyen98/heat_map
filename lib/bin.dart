import 'dart:math';

class Bin {
  Bin(this.x, this.y, this.colorLevel, double binWidth, double binHeight) {
    xCenter = x + (binWidth / 2);
    yCenter = y + (binHeight / 2);
  }
  double x;
  double y;
  int colorLevel;
  double xCenter;
  double yCenter;

  double getDistanceToPoint(double radarX, double radarY) {
    return sqrt(pow((radarX - xCenter), 2) + pow((radarY - yCenter), 2));
  }

  @override
  String toString() {
    return '$colorLevel';
    // return '($x, $y, $colorLevel)';
  }

  static printMatrix(List<List<Bin>> matrix) {
    for (int i = 0; i < matrix.length; i++) {
      print(matrix[i]);
    }
  }
}
