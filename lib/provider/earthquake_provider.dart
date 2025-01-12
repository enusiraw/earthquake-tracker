import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/earthquake.dart';
import '../services/earthquake_service.dart';

final earthquakeProvider = FutureProvider<List<Earthquake>>((ref) async {
  final service = EarthquakeService();
  final data = await service.fetchEarthquakes(
    startTime: '2025-01-01',
    endTime: '2025-01-10',
    minMagnitude: 4.0,
  );

  return data.map((e) => Earthquake.fromJson(e)).toList();
});
