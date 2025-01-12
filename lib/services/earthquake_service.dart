import 'dart:convert';
import 'package:http/http.dart' as http;

class EarthquakeService {
  static const String baseUrl =
      'https://earthquake.usgs.gov/fdsnws/event/1/query';

  Future<List<dynamic>> fetchEarthquakes(
      {String startTime = '',
      String endTime = '',
      double minMagnitude = 4.0}) async {
    final url = Uri.parse(
        '$baseUrl?format=geojson&starttime=$startTime&endtime=$endTime&minmagnitude=$minMagnitude');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['features']; // Return the list of earthquakes
    } else {
      throw Exception('Failed to fetch earthquake data');
    }
  }
}
