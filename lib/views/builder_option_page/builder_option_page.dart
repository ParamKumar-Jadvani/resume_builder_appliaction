import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../routes/app_routes.dart';

class BuilderOptionPage extends StatefulWidget {
  const BuilderOptionPage({super.key});

  @override
  State<BuilderOptionPage> createState() => _BuilderOptionPageState();
}

class _BuilderOptionPageState extends State<BuilderOptionPage> {
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.grey),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Build Option Page'),
      ),
      body: ListView.builder(
        itemCount: AppRoutes.allOptions.length,
        itemBuilder: (context, index) {
          final option = AppRoutes.allOptions[index];
          return ListTile(
            leading: Image.asset(
              option['icon'],
              height: 40,
            ),
            title: Text(
              option['title'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, option['route']);
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          );
        },
      ),
    );
  }
}
