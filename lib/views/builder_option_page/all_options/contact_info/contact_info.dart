import 'package:flutter/material.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  int index = 0;
  List<Map> colors = [
    {
      'name': "RED",
      'color': Colors.red,
    },
    {
      'name': "GREEN",
      'color': Colors.green,
    },
    {
      'name': "BLUE",
      'color': Colors.blue,
    },
  ];

  void setIndex(int i) {
    index = i;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Contact Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IndexedStack(
              index: index,
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: colors
                  .map(
                    (e) => Container(
                      height: 200,
                      width: 200,
                      color: e['color'],
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: colors
                  .map(
                    (e) => ElevatedButton(
                      onPressed: () {
                        setIndex(
                          colors.indexOf(e),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: e['color'],
                          foregroundColor: Colors.white),
                      child: Text(e['name']),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
