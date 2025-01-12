import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/earthquake.dart';
import '../services/earthquake_service.dart';

final earthquakeProvider = FutureProvider<List<Earthquake>>((ref) async {
  final service = EarthquakeService();
  final currentDate = DateTime.now();
  final twoWeeksAgo = currentDate.subtract(const Duration(days: 14));
  final endTime =
      "${currentDate.year}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')}";
  final startTime =
      "${twoWeeksAgo.year}-${twoWeeksAgo.month.toString().padLeft(2, '0')}-${twoWeeksAgo.day.toString().padLeft(2, '0')}";


  final data = await service.fetchEarthquakes(
    startTime: startTime,
    endTime: endTime,
    minMagnitude: 4.0,
  );

  return data.map((e) => Earthquake.fromJson(e)).toList();
});
