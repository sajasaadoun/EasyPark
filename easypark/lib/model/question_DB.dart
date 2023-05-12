import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    super.initState();
    _getQuestionsFromFirestore();
  }

  Future<void> _getQuestionsFromFirestore() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('questionnaire').get();

    setState(() {
      questions = snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  void handleAnswer(int index) {
    bool isCorrect =
        questions[currentQuestionIndex]['options'][index]['isCorrect'];
    if (isCorrect) {
      score++;
    }
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Quiz Results'),
            content: Text('You scored $score out of ${questions.length}!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(children: [
            const Text(
              "Questionnaire",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            _questionWidget(),
            _answerList(),
            _nextButton(),
          ]),
        ),
      ),
    );
  }
}
