import 'package:flutter/material.dart';
import '../model/earthquake.dart';

class EarthquakeListView extends StatelessWidget {
  final List<Earthquake> earthquakes;

  const EarthquakeListView({Key? key, required this.earthquakes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: earthquakes.length,
      itemBuilder: (context, index) {
        final earthquake = earthquakes[index];

        // Determine the color based on magnitude
        final magnitudeColor = earthquake.magnitude >= 5
            ? Colors.red
            : earthquake.magnitude >= 4
                ? Colors.orange
                : Colors.green;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          elevation: 4,
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Handle nullable countryCode
                Text(
                  earthquake.countryCode ?? 'Unknown',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            title: Text(
              earthquake.place,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display date and time, ensure non-null and properly formatted
                Text(
                  'Date: ${earthquake.time.toLocal().toString().split(' ')[0]}',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  'Time: ${earthquake.time.toLocal().toString().split(' ')[1]}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: magnitudeColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                earthquake.magnitude.toStringAsFixed(1),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              // Handle navigation or additional details here
            },
          ),
        );
      },
    );
  }
}
