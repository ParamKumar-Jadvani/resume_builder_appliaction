import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class BuilderOptionPage extends StatefulWidget {
  const BuilderOptionPage({super.key});

  @override
  State<BuilderOptionPage> createState() => _BuilderOptionPageState();
}

class _BuilderOptionPageState extends State<BuilderOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xFF3A82F7), // Dark Blue
        title: const Text(
          'Build Option Page',
          style: TextStyle(
            color: Colors.white, // White text for AppBar
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 4, // Subtle shadow for AppBar
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListView.separated(
          itemCount: AppRoutes.allOptions.length,
          separatorBuilder: (context, index) => const Divider(
            color: Color(0xFFDDDDDD), // Light Gray divider
            thickness: 1.5,
            height: 1,
          ),
          itemBuilder: (context, index) {
            final option = AppRoutes.allOptions[index];
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              leading: Container(
                decoration: BoxDecoration(
                  color: const Color(
                      0xFFE6F1FF), // Light Blue background for icons
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    option['icon'],
                    height: 36,
                    width: 36,
                  ),
                ),
              ),
              title: Text(
                option['title'],
                style: const TextStyle(
                  color: Color(0xFF344955), // Darker Gray-Blue
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, option['route']);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF3A82F7), // Dark Blue
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
