import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_appliaction/utils/extension.dart';
import 'package:resume_builder_appliaction/utils/globals.dart';

class TechnicalSkillsPage extends StatefulWidget {
  const TechnicalSkillsPage({super.key});

  @override
  State<TechnicalSkillsPage> createState() => _TechnicalSkillsPageState();
}

class _TechnicalSkillsPageState extends State<TechnicalSkillsPage> {
  List<TextEditingController> allControllers = [];

  void setTextField({required int length}) {
    Globals.skills.forEach((text) {
      allControllers.add(TextEditingController(text: text));
    });
    Globals.skills.length < 2
        ? allControllers.add(TextEditingController())
        : null;
  }

  @override
  void initState() {
    Globals.skills.isNotEmpty
        ? setTextField(length: Globals.skills.length)
        : allControllers = List.generate(2, (index) => TextEditingController());
    super.initState();
  }

  @override
  void dispose() {
    Globals.skills.clear();
    for (final controller in allControllers) {
      controller.text.isNotEmpty ? Globals.skills.add(controller.text) : null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Technical Skills"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Enter Technical Skills"),
                  Column(
                    children: List.generate(
                      allControllers.length,
                      (index) => Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: allControllers[index],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              allControllers[index].clear();
                              allControllers.removeAt(index);
                              setState(() {});
                            },
                            icon: const Icon(CupertinoIcons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.h,
                  ElevatedButton.icon(
                    onPressed: () {
                      allControllers.add(TextEditingController());
                      setState(() {});
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("ADD"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
