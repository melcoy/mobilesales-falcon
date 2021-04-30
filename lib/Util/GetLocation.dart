import 'package:geolocator/geolocator.dart';

class GetLocation {
  Future<List<dynamic>> getLocation() async {
    Position currentLocation;
    var coordinate = [];
    try {
      currentLocation = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      coordinate.add(currentLocation.latitude.toString());
      coordinate.add(currentLocation.longitude.toString());

      return coordinate;
    } catch (error) {
      print(error);
      return coordinate;
    }
  }
}
