import 'package:flutter/material.dart';
import 'package:new_app/map_location.dart';
import 'video_call_page.dart';

class ConfirmLocationPage extends StatelessWidget {
  const ConfirmLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              'SAGIPSIKLAB',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'EMERGENCY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 400,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Do you confirm this location?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Current Location: Brgy. Pasong Tamo',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the Video Call Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const VideoCallPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                     onPressed: () {
                       Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => const MapLocationPage()),
                       );
                   },
                     style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.red,
                   ),
                     child: const Text(
                      'Change Location',
                    style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
