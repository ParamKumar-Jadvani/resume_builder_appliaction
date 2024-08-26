import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_appliaction/routes/app_routes.dart';
import 'package:resume_builder_appliaction/utils/extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define color codes
    const Color lightGray = Color(0xFFE6F1FF); // Light Gray background
    const Color darkBlue = Color(0xFF349EF9); // Dark Blue for accents

    // Set up a Timer to navigate to the next page after 3 seconds
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
        timer.cancel();
      },
    );

    return Scaffold(
      backgroundColor: lightGray, // Use Light Gray as background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo or image
            kIsWeb
                ? Image.network(
                    'lib/assets/gif/splash_screen_gif.gif',
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'lib/assets/gif/splash_screen_gif.gif',
                    fit: BoxFit.cover,
                  ),
            20.h, // Space between the image and the loading indicator
            // Loading indicator
            const CircularProgressIndicator(
              color: darkBlue, // Dark Blue color for the loading circle
            ),
          ],
        ),
      ),
    );
  }
}
