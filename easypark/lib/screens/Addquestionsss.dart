// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/ques_model.dart';

class AddQuestions extends StatefulWidget {
  const AddQuestions({Key? key}) : super(key: key);

  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

final formkey = GlobalKey<FormState>();

class _AddQuestionsState extends State<AddQuestions> {
  final questionData = QuesModel();
  TextEditingController question = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option5 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController option2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Add A New Question to the questionnaire',
            style:
                TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'admin');
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Enter the question with its five options ',
                                style: TextStyle(fontSize: 20),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: question,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Question',
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
                                labelText: 'Option 1 ',
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
                                labelText: 'Option 2 ',
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
                                labelText: 'Option 3',
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
                                labelText: 'Option 4',
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
                                labelText: 'Option 5 ',
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
                              child: const Text('Submit',
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
