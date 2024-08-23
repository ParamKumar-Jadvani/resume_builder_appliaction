import 'package:flutter/material.dart';
import 'package:resume_builder_appliaction/utils/extension.dart';
import 'package:resume_builder_appliaction/utils/globals.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;
  String _formattedDate = '';
  List<String> availableLanguages = [
    "Hindi",
    "English",
    "Gujarati",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Detail Page'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          color: Colors.grey[100],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'DOB',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  hintText: 'Select your date of birth',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                      _formattedDate = _selectedDate!.toLocal().toString();
                      _dateController.text = _formattedDate; // Update TextField
                    });
                  }
                },
              ),
              15.h,
              const Text('Marital Status'),
              RadioListTile(
                  title: const Text("Single"),
                  value: "Single",
                  groupValue: Globals.status,
                  onChanged: (value) {
                    Globals.status = value;
                    setState(() {});
                  }),
              RadioListTile(
                title: const Text("Married"),
                value: "Married",
                groupValue: Globals.status,
                onChanged: (val) {
                  Globals.status = val;
                  setState(() {});
                },
              ),
              15.h,
              const Text("Language known"),
              ...availableLanguages.map(
                (e) => CheckboxListTile(
                  title: Text(e.toUpperCase()),
                  value: Globals.language.contains(e),
                  onChanged: (value) {
                    if (value!) {
                      Globals.language.add(e);
                    } else {
                      Globals.language.remove(e);
                    }
                    setState(() {});
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
