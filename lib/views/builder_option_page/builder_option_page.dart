import 'package:flutter/material.dart';

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
        title: const Text('Build Option Page'),
      ),
    );
  }
}
