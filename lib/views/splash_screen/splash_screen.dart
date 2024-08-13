import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_appliaction/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: kIsWeb
            ? Image.network('lib/assets/gif/splash_screen_gif.gif')
            : Image.asset('lib/assets/gif/splash_screen_gif.gif'),
      ),
    );
  }
}
