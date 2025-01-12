class Earthquake {
  final String place;
  final double magnitude;
  final DateTime time;
  final String countryCode;

  Earthquake({
    required this.place,
    required this.magnitude,
    required this.time,
    required this.countryCode,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    final place = json['properties']['place'] ?? 'Unknown place';
    final magnitude = json['properties']['mag'] != null
        ? json['properties']['mag'].toDouble()
        : 0.0;
    final time =
        DateTime.fromMillisecondsSinceEpoch(json['properties']['time']);
    final countryCode = json['properties']['countryCode'] ?? 'Unknown';

    return Earthquake(
      place: place,
      magnitude: magnitude,
      time: time,
      countryCode: countryCode,
    );
  }
}
