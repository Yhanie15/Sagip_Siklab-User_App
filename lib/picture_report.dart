import 'package:flutter/material.dart';
import 'picture_confirmation.dart';

class PictureReportPage extends StatelessWidget {
  const PictureReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Background color to match the design
      body: Stack(
        children: [
          // Main content area with an empty placeholder for the picture
          Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[200], // Placeholder color for the picture area
              child: const Center(
                child: Icon(
                  Icons.image,
                  color: Colors.grey,
                  size: 100,
                ),
              ),
            ),
          ),
          // Bottom action bar with camera and refresh icons
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Camera button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PictureConfirmationPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  // Refresh button
                  GestureDetector(
                    onTap: () {
                      // Add refresh functionality here
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.refresh,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
