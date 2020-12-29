import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationService{

  static final LocationService _sharedManager = new LocationService._internal();

  LocationService._internal();

  factory LocationService() {
    return _sharedManager;
  }

  Future<LatLng> getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return LatLng(10.803876, 106.635679);
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        return LatLng(10.803876, 106.635679);
      }
    }
    return LatLng(10.803876, 106.635679);
  }
}