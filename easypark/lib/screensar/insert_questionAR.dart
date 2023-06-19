import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class InsertDataAR extends StatefulWidget {
  const InsertDataAR({Key? key}) : super(key: key);

  @override
  State<InsertDataAR> createState() => _InsertDataARState();
}

class _InsertDataARState extends State<InsertDataAR> {
  final questionController = TextEditingController();
  final option0Controller = TextEditingController();
  final option1Controller = TextEditingController();
  final option2Controller = TextEditingController();
  final option3Controller = TextEditingController();
  final option4Controller = TextEditingController();

  final questionControllerAr = TextEditingController();
  final option0ControllerAr = TextEditingController();
  final option1ControllerAr = TextEditingController();
  final option2ControllerAr = TextEditingController();
  final option3ControllerAr = TextEditingController();
  final option4ControllerAr = TextEditingController();

  late DatabaseReference dbRef;
  late DatabaseReference dbRefAr;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('questions');
    dbRefAr = FirebaseDatabase.instance.ref().child('questionsAr');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Add A New Question / أضف سؤال جديد',
          style: TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/ar/admin');
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // const SizedBox(
              //   height: 10,
              // ),
              // const Text(
              //   'Inserting data in Firebase Realtime Database',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.w500,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              TextField(
                controller: questionControllerAr,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'السؤال',
                  hintText: 'اكتب سؤالك هنا',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option0ControllerAr,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'الاجابة الاولى',
                  hintText: 'اضف الاجابة الاولى',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option1ControllerAr,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'الاجابة الثانية',
                  hintText: 'اضف الاجابة الثانية',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option2ControllerAr,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'الاجابة الثالثة',
                  hintText: 'اضف الاجابة الثالثة',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option3ControllerAr,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'الاجابة الرابعة',
                  hintText: 'اضف الاجابة الرابعة',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option4ControllerAr,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'الاجابة الخامسة',
                  hintText: 'اضف الاجابة الخامسة',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: questionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Question',
                  hintText: 'Enter your Question',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option0Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Answer',
                  hintText: 'Enter your first answer option',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option1Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Second Answer',
                  hintText: 'Enter your second answer option',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option2Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Third Answer',
                  hintText: 'Enter your third answer option',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option3Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fourth Answer',
                  hintText: 'Enter your fourth answer option',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option4Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fifth Answer',
                  hintText: 'Enter your fifth answer option',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Add Question'),
                            content: Text(
                                'Are you sure that you want to add this question?'),
                            actions: [
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () => Navigator.pop(context),
                              ),
                              TextButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  Map<dynamic, dynamic> questionsAr = {
                                    'options': {
                                      "0A": option0ControllerAr.text,
                                      "1A": option1ControllerAr.text,
                                      "2A": option2ControllerAr.text,
                                      "3A": option3ControllerAr.text,
                                      "4A": option4ControllerAr.text
                                    },
                                    'title': questionControllerAr.text
                                  };
                                  Map<dynamic, dynamic> questions = {
                                    'options': {
                                      "0A": option0Controller.text,
                                      "1A": option1Controller.text,
                                      "2A": option2Controller.text,
                                      "3A": option3Controller.text,
                                      "4A": option4Controller.text
                                    },
                                    'title': questionController.text
                                  };

                                  dbRefAr.push().set(questionsAr);
                                  dbRef.push().set(questions);
                                  Navigator.pushNamed(
                                      context, '/ar/insertQuestions');
                                },
                              )
                            ],
                          ));
                },
                child: const Text('Submit / اضف السؤال'),
                color: Colors.white,
                textColor: Colors.blue,
                minWidth: 300,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
