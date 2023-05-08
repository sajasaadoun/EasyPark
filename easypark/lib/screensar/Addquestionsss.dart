// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/qs_Model.dart';

class AddQuestionsAr extends StatefulWidget {
  const AddQuestionsAr({Key? key}) : super(key: key);

  @override
  State<AddQuestionsAr> createState() => _AddQuestionsState();
}

final formkey = GlobalKey<FormState>();

class _AddQuestionsState extends State<AddQuestionsAr> {
  final questionData = QuesModel();
  TextEditingController question = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option5 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController questionAr = TextEditingController();
  TextEditingController option1Ar = TextEditingController();
  TextEditingController option5Ar = TextEditingController();
  TextEditingController option3Ar = TextEditingController();
  TextEditingController option4Ar = TextEditingController();
  TextEditingController option2Ar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        body: Container(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: question,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'السؤال بالانجليزية',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: option1,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'الاجابة 1 بالانجليزية ',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: option2,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'الاجابة 2 بالانجليزية ',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: option3,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'الاجابة 3 بالانجليزية',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: option4,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'الاجابة 4 بالانجليزي',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: option5,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'الاجابة 5 بالانجليزي ',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: questionAr,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'السؤال بالعربي',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: option1Ar,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'الاجابة 1 بالعربي ',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: option2Ar,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'الاجابة 2 بالعربي ',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: option3Ar,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'الاجابة 3 بالعربي',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: option4Ar,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'الاجابة 4 بالعربي',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: option5Ar,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'الاجابة 5 بالعربي ',
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              child: const Text('تقديم',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  try {
                                    await questionData.questionAdded(
                                      question: question.text,
                                      option1: option1.text,
                                      option2: option2.text,
                                      option3: option3.text,
                                      option4: option4.text,
                                      option5: option5.text,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Successfully Added')),
                                    );
                                  } catch (error) {
                                    print(
                                        'Error: $error'); // Print the error in the terminal
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Something went wrong. Please try again.'),
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Please correct the errors in the form.'),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      )))),
        ));
  }
}
