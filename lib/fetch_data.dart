class FakeData {
  static RadarData getData() => RadarData(
      coordinate: Coordinate(
        x: 60,
        y: 60,
      ),
      nativeSize: NativeSize(
        width: 20,
        height: 10,
      ),
      aveCrowdLevel: 50);

  static List<RadarData> getListData() => <RadarData>[
        RadarData(
            coordinate: Coordinate(
              x: 200,
              y: 300,
            ),
            nativeSize: NativeSize(
              width: 20,
              height: 10,
            ),
            aveCrowdLevel: 90),
        RadarData(
            coordinate: Coordinate(
              x: 130,
              y: 110,
            ),
            nativeSize: NativeSize(
              width: 20,
              height: 10,
            ),
            aveCrowdLevel: 150),
        RadarData(
            coordinate: Coordinate(
              x: 170,
              y: 180,
            ),
            nativeSize: NativeSize(
              width: 20,
              height: 10,
            ),
            aveCrowdLevel: 300),
        RadarData(
            coordinate: Coordinate(
              x: 150,
              y: 200,
            ),
            nativeSize: NativeSize(
              width: 20,
              height: 10,
            ),
            aveCrowdLevel: 100),
      ];
}

class RadarData {
  RadarData({
    this.coordinate,
    this.nativeSize,
    this.aveCrowdLevel,
  });

  Coordinate coordinate;
  NativeSize nativeSize;
  double aveCrowdLevel;
}

class Coordinate {
  Coordinate({
    this.x,
    this.y,
  });

  double x;
  double y;
}

class NativeSize {
  NativeSize({
    this.width,
    this.height,
  });

  double width;
  double height;
}
