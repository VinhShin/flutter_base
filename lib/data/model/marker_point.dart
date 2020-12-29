
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerPoint {
  String name;
  String address;
  LatLng latLng;

  MarkerPoint(this.name, this.latLng, {this.address});
}
