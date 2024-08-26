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
  List<String> availableLanguages = [
    "Hindi",
    "English",
    "Gujarati",
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: darkBlue,
            hintColor: darkBlue,
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = _formatDate(_selectedDate!);
        Globals.selectedDate = _selectedDate;
      });
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Detail Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: darkBlue, // Use dark blue for the AppBar
      ),
      backgroundColor: lightBlue, // Use light blue for the background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          color: Colors.grey[100],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "DOB",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  hintText: "DD/MM/YYYY",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(Icons.calendar_today, color: darkBlue),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 14.0,
                  ),
                ),
              ),
              20.h,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Marital Status',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              RadioListTile(
                title: const Text("Single"),
                value: "Single",
                groupValue: Globals.status,
                onChanged: (value) {
                  setState(() {
                    Globals.status = value;
                  });
                },
                activeColor: darkBlue,
              ),
              RadioListTile(
                title: const Text("Married"),
                value: "Married",
                groupValue: Globals.status,
                onChanged: (val) {
                  setState(() {
                    Globals.status = val;
                  });
                },
                activeColor: darkBlue,
              ),
              20.h,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Language known",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              ...availableLanguages.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CheckboxListTile(
                    title: Text(e.toUpperCase()),
                    value: Globals.language.contains(e),
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          Globals.language.add(e);
                        } else {
                          Globals.language.remove(e);
                        }
                      });
                    },
                    activeColor: darkBlue,
                  ),
                ),
              ),
              20.h,
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: darkBlue,
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Define your color codes here
const Color darkBlue = Color(0xFF3A82F7);
const Color lightBlue = Color(0xFFE6F1FF);
