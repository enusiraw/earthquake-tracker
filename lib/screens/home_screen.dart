import 'package:earth_quake/screens/earthquake_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/earthquake_provider.dart';


class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final earthquakeAsync = ref.watch(earthquakeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Earthquake Tracker'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("lib/Assets/earthquakelogo.png"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.map),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
     body: earthquakeAsync.when(
        data: (earthquakes) {
          if (earthquakes.isEmpty) {
            return Center(child: Text('No Earthquake Data Available'));
          }
          return EarthquakeListView(earthquakes: earthquakes);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text(
            'Error: $err',
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      ),

    );
  }
}
