import 'package:geolocator/geolocator.dart';

class GetLocation {
  Future<List<dynamic>> getLocation() async {
    Position currentLocation;
    var coordinate = [];
    try {
      currentLocation = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      coordinate.add("Lat:" + currentLocation.latitude.toString());
      coordinate.add("Long:" + currentLocation.longitude.toString());

      return coordinate;
    } catch (error) {
      print(error);
      return coordinate;
    }
  }
}
