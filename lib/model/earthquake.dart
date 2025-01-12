class Earthquake {
  final String id;
  final String place;
  final double magnitude;
  final DateTime time;

  Earthquake(
      {required this.id,
      required this.place,
      required this.magnitude,
      required this.time});

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return Earthquake(
      id: json['id'],
      place: json['properties']['place'] ?? 'Unknown',
      magnitude: (json['properties']['mag'] as num).toDouble(),
      time: DateTime.fromMillisecondsSinceEpoch(json['properties']['time']),
    );
  }
}
