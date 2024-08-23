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
  bool hide = true;

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Contact Info'),
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
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: index == 0 ? 5 : 0,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 18,
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
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: index == 1 ? 5 : 0,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Photo',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
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
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(12.0),
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
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  prefixIcon: const Icon(Icons.person),
                                  labelText: 'Name',
                                  hintText: 'Enter Name',
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
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  prefixIcon: const Icon(Icons.phone),
                                  labelText: 'Phone',
                                  hintText: 'Enter Phone',
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
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  prefixIcon: const Icon(Icons.email),
                                  labelText: 'Email',
                                  hintText: 'Enter Email',
                                ),
                              ),
                              30.h,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      formKey.currentState!.reset();
                                      Globals.name = Globals.email = Globals
                                          .contact = Globals.password = null;
                                      setState(() {});
                                    },
                                    child: const Text("RESET"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      bool validated =
                                          formKey.currentState!.validate();
                                      if (validated) {
                                        formKey.currentState!.save();
                                        SnackBar snackBar = const SnackBar(
                                          content: Text(
                                              "Form Saved Successfully...!!"),
                                          backgroundColor: Colors.green,
                                          behavior: SnackBarBehavior.floating,
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      } else {
                                        SnackBar snackBar = const SnackBar(
                                          content: Text(
                                              "Form Submission Failed... !!"),
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    child: const Text("SAVE"),
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
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            foregroundImage: Globals.image != null
                                ? FileImage(Globals.image!)
                                : null,
                            child: const Text("Add Image"),
                          ),
                          FloatingActionButton.small(
                            onPressed: () async {
                              ImagePicker imagePicker = ImagePicker();
                              XFile? file = await imagePicker.pickImage(
                                  source: ImageSource.camera);

                              if (file != null) {
                                Globals.image = File(file.path);
                                setState(() {});
                              }
                            },
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
