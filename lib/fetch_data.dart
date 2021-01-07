import 'coordinate.dart';
import 'native_size.dart';
import 'radar_single.dart';

class FakeData {
  static RadarSingle getData() => RadarSingle(
      coordinate: Coordinate(
        x: 60,
        y: 60,
      ),
      nativeSize: NativeSize(
        width: 20,
        height: 10,
      ),
      aveCrowdLevel: 50);

  static List<RadarSingle> getListData() => <RadarSingle>[
        RadarSingle(
            coordinate: Coordinate(
              x: 200,
              y: 300,
            ),
            nativeSize: NativeSize(
              width: 20,
              height: 10,
            ),
            aveCrowdLevel: 90),
        RadarSingle(
            coordinate: Coordinate(
              x: 130,
              y: 110,
            ),
            nativeSize: NativeSize(
              width: 20,
              height: 10,
            ),
            aveCrowdLevel: 150),
        RadarSingle(
            coordinate: Coordinate(
              x: 170,
              y: 180,
            ),
            nativeSize: NativeSize(
              width: 20,
              height: 10,
            ),
            aveCrowdLevel: 300),
        RadarSingle(
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