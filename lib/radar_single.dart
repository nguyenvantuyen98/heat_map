import 'coordinate.dart';
import 'native_size.dart';

class RadarSingle {
  RadarSingle({
    this.coordinate,
    this.nativeSize,
    this.aveCrowdLevel,
  });

  Coordinate coordinate;
  NativeSize nativeSize;
  double aveCrowdLevel;
}
