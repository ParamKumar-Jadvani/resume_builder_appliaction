import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder_appliaction/utils/extension.dart';

import '../../../../utils/globals.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  int index = 0;

  static final RegExp emailRedExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setIndex({required int index}) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Define color codes
    const Color darkBlue = Color(0xFF3A82F7);
    const Color lightBlue = Color(0xFFE6F1FF);
    const Color darkerGrayBlue = Color(0xFF344955);
    const Color white = Colors.white;
    const Color gray = Colors.grey;
    const Color red = Colors.red;

    return Scaffold(
      backgroundColor: lightBlue, // Use light blue as the background color
      appBar: AppBar(
        title: const Text('Contact Info'),
        backgroundColor: darkBlue, // Dark Blue for AppBar
        foregroundColor: white, // White text color in AppBar
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setIndex(index: 0);
                    },
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: white,
                        border: Border(
                          bottom: BorderSide(
                            color: index == 0 ? darkBlue : gray,
                            width: index == 0 ? 4 : 1,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 18,
                            color: darkerGrayBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setIndex(index: 1);
                    },
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: white,
                        border: Border(
                          bottom: BorderSide(
                            color: index == 1 ? darkBlue : gray,
                            width: index == 1 ? 4 : 1,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Photo',
                          style: TextStyle(
                            fontSize: 18,
                            color: darkerGrayBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: IndexedStack(
                  index: index,
                  children: [
                    // Contact Page
                    Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                initialValue: Globals.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  Globals.name = value;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  labelText: 'Name',
                                  hintText: 'Enter Name',
                                ),
                              ),
                              15.h,
                              TextFormField(
                                initialValue: Globals.email,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Email';
                                  } else if (!emailRedExp.hasMatch(value)) {
                                    return 'Please enter a valid email address !!';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  Globals.email = value;
                                },
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  labelText: 'Email',
                                  hintText: 'Enter Email',
                                ),
                              ),
                              15.h,
                              TextFormField(
                                initialValue: Globals.contact,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Number';
                                  } else if (value.length < 10) {
                                    return 'Contact number must be of 10 digits !!';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  Globals.contact = value;
                                },
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  labelText: 'Phone',
                                  hintText: 'Enter Phone',
                                ),
                              ),
                              30.h,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: white,
                                      backgroundColor: darkBlue,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                    ),
                                    onPressed: () {
                                      formKey.currentState!.reset();
                                      Globals.name = Globals.email =
                                          Globals.contact = null;
                                      setState(() {});
                                    },
                                    child: const Text(
                                      "RESET",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: white,
                                      backgroundColor: darkBlue,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                    ),
                                    onPressed: () {
                                      bool validated =
                                          formKey.currentState!.validate();
                                      if (validated) {
                                        formKey.currentState!.save();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Form Saved Successfully...!!"),
                                            backgroundColor:
                                                darkBlue, // Dark Blue
                                            behavior: SnackBarBehavior.floating,
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Form Submission Failed... !!"),
                                            backgroundColor: red,
                                            behavior: SnackBarBehavior.floating,
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      "SAVE",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Photo Page
                    Container(
                      width: double.infinity,
                      height: size.height * 0.25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 72,
                            foregroundImage: Globals.image != null
                                ? FileImage(Globals.image!)
                                : null,
                            backgroundColor:
                                lightBlue, // Light Blue for background
                            child: const Text("Add Image"),
                          ),
                          FloatingActionButton(
                            onPressed: () async {
                              ImagePicker imagePicker = ImagePicker();
                              XFile? file = await imagePicker.pickImage(
                                  source: ImageSource.camera);

                              if (file != null) {
                                Globals.image = File(file.path);
                                setState(() {});
                              }
                            },
                            backgroundColor: darkBlue,
                            foregroundColor: white,
                            child: const Icon(Icons.camera),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
