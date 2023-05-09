import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
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
        title: Text('Insert Question / اضف سؤال'),
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
                  Map<dynamic, dynamic> questionsAr = {
                    'options': {
                      option0ControllerAr.text: 0,
                      option1ControllerAr.text: 1,
                      option2ControllerAr.text: 2,
                      option3ControllerAr.text: 3,
                      option4ControllerAr.text: 4
                    },
                    'title': questionControllerAr.text
                  };
                  Map<dynamic, dynamic> questions = {
                    'options': {
                      option0Controller.text: 0,
                      option1Controller.text: 1,
                      option2Controller.text: 2,
                      option3Controller.text: 3,
                      option4Controller.text: 4
                    },
                    'title': questionController.text
                  };

                  dbRefAr.push().set(questionsAr);
                  dbRef.push().set(questions);
                  Navigator.pushNamed(context, '/ar/insertQuestions');
                },
                child: const Text('Submit / اضف السؤال'),
                color: Colors.blue,
                textColor: Colors.white,
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
