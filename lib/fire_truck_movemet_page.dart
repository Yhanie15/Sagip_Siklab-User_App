import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FireTruckMovementPage extends StatelessWidget {
  final String reportTitle;
  final String fireTruckNumber;

  const FireTruckMovementPage({super.key, required this.reportTitle, required this.fireTruckNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fire Truck Movement'),
      ),
      body: Stack(
        children: [
          // FlutterMap widget using Mapbox
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(14.6760, 121.0437), // Example coordinates ( QUEZON CITY, Philippines)
              initialZoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              const MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(14.6769, 121.0343), // Example coordinates for fire truck location
                    width: 80.0,
                    height: 80.0,
                    child: Icon(Icons.fire_truck, size: 35, color: Colors.black),
                  ),
                  Marker(
                    point: LatLng(14.6771, 121.0413), // Example coordinates for fire scene location
                    width: 80.0,
                    height: 80.0,
                    child: Icon(Icons.location_on, size: 35, color: Colors.red),
                  ),
                ],
              ),
              PolylineLayer(
                polylines: [
                   Polyline(
                    points: [
                      const LatLng(14.6769, 121.0343), // Start point (fire truck location)
                      const LatLng(14.6772, 121.0360), // Intermediate point for better route curve
                      const LatLng(14.6765, 121.0385), // Intermediate point for better route curve
                      const LatLng(14.6771, 121.0413), // End point (fire scene location)
                    ],
                    strokeWidth: 4.0,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
          // Top overlay with information
          Positioned(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'The fire truck is on its way to the scene at $reportTitle',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Estimated Time of Arrival: 11 minutes',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Bottom overlay with fire truck information
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Fire truck image (placeholder)
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 30,
                      child: Icon(Icons.fire_truck, size: 30, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    // Fire truck number and details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fire Truck $fireTruckNumber',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Row(
                          children: [
                            SizedBox(width: 4),
                            Text('Tandang Sora Fire Station', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
