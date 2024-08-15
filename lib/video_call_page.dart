import 'package:flutter/material.dart';
import 'activity_page.dart'; // Import ActivityPage for navigation

class VideoCallPage extends StatelessWidget {
  const VideoCallPage({super.key});

  void _endCall(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thank you for reporting an incident!'),
          content: const Text(
            'You will be redirected to the activity tab to check the status of your report.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst); // Go back to the main page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ActivityPage(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // User's Video Feed (Placeholder)
          Container(
            color: Colors.grey[800],
            child: const Center(
              child: Text(
                'User Video Feed',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          // Admin's Controls
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Mute Button
                IconButton(
                  icon: const Icon(Icons.mic_off, color: Colors.white, size: 30),
                  onPressed: () {
                    // Mute functionality
                  },
                ),
                // End Call Button
                IconButton(
                  icon: const Icon(Icons.call_end, color: Colors.red, size: 40),
                  onPressed: () {
                    _endCall(context);
                  },
                ),
                // Switch Camera
                IconButton(
                  icon: const Icon(Icons.switch_camera, color: Colors.white, size: 30),
                  onPressed: () {
                    // Switch camera functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
